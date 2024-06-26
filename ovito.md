Install Ovito Pro on M1
Python script plugin `ovitos` is in `\Applications/Ovito.app/Contents/MacOS/`.
Changing path of `ovitos` to `export PATH="/Applications/Ovito.app/Contents/MacOS/:$PATH"`, then run 
```
ovitos -m pip install gsd
ovitos -m pip install freud-analysis
ovitos -m pip install matplotlib==3.7.3
```

To install `torch-geometric` and `dgl` with ovitos, must upgrad ovitos pip to version `23.1.2` with
```
/Applications/Ovito.app/Contents/MacOS/Ovito.app/Contents/MacOS/ovitos -m pip install --upgrade pip
```
then install `torch-geometric` with
```
ovitos -m pip install torch
ovitos -m pip --no-cache-dir  install  torch-scatter -f https://data.pyg.org/whl/torch-1.13.1+${cpu}.html
ovitos -m pip --no-cache-dir  install  torch-sparse -f https://data.pyg.org/whl/torch-1.13.1+${cpu}.html
ovitos -m pip --no-cache-dir  install  torch-geometric
```
and install `dgl` with
```
ovitos -m pip --no-cache-dir install dgl -f https://data.dgl.ai/wheels/repo.html
```

Modifier for Steinhardt
```
from ovito.data import *
import freud

def modify(frame: int, data: DataCollection):

    if data.particles is not None:
        ql = freud.order.Steinhardt(l=6)
        system =  system = freud.AABBQuery.from_system(data)
        args = {"num_neighbors": 6, "exclude_ii": True}
        nlist = system.query(data.particles['Position'], args).toNeighborList()
        ql.compute(system, neighbors=nlist)
        data.particles_.create_property(
            name="Ql", dtype=float, data=ql.particle_order
        )
        print(f"Created Ql property for {data.particles.count} particles.")
```
Modifier for loading gsd via SourceFile provided by ovito as global attribute.
```
from ovito.data import *

import gsd.hoomd

def modify(frame: int, data: DataCollection):
    """
    This is a modifier demonstrating how to use SourceFile to load gsd.
    """
    traj = gsd.hoomd.open(data.attributes['SourceFile'])
    f = traj[frame]
    
    gsd_r1 = 0.5 * f.particles.type_shapes[0]['diameter']
    gsd_r2 = 0.5 * f.particles.type_shapes[1]['diameter']
    
    print(gsd_r1, gsd_r2)
    
    ovito_r1 = data.particles_.particle_types_.type_by_id_(0).radius
    ovito_r2 = data.particles_.particle_types_.type_by_id_(1).radius
    print(ovito_r1, ovito_r2)

```


Viewport layers

Diffraction pattern
```
from ovito.vis import *
import numpy as np
import PySide6.QtGui
import rowan

import freud

print("Diffraction, freud version", freud.__version__)


def render(
    args,
    grid_size=256,
    output_size=256,
    draw_x: float = 10,
    draw_y: float = 10,
    zoom: float = 1,
):
    pipeline = args.scene.selected_pipeline
    if not pipeline:
        return
    data = pipeline.compute(args.frame)
    view_orientation = rowan.from_matrix(args.viewport.viewMatrix[:, :3])
    dp = freud.diffraction.DiffractionPattern(
        grid_size=grid_size,
        output_size=output_size,
    )
    dp.compute(
        system=data,
        view_orientation=view_orientation,
        zoom=zoom,
        peak_width=1,
    )
    buf = dp.to_image(cmap="afmhot", vmax=np.max(dp.diffraction))
    width, height, bytes_per_pixel = buf.shape
    img = PySide6.QtGui.QImage(
        buf,
        width,
        height,
        width * bytes_per_pixel,
        PySide6.QtGui.QImage.Format_RGBA8888,
    )
    # Paint QImage onto viewport canvas
    args.painter.drawImage(draw_x, draw_y, img)
```


Bond order digram
```
from typing import Tuple

import numpy as np
import PySide6.QtGui
import rowan

import freud


def to_view(bod, view_orientation, image_size):
    lin_grid = np.linspace(-1, 1, image_size)
    x, y = np.meshgrid(lin_grid, lin_grid)
    y = -y
    r2 = x**2 + y**2
    z = np.sqrt(np.clip(1 - r2, 0, None))
    xyz = np.dstack((x, y, z))
    xyz = rowan.rotate(rowan.inverse(view_orientation), xyz)
    x, y, z = xyz[:, :, 0], xyz[:, :, 1], xyz[:, :, 2]
    view = np.zeros((image_size, image_size))
    phi = np.arccos(z)
    theta = np.arctan2(y, x) % (2 * np.pi)
    num_theta_bins, num_phi_bins = bod.nbins
    theta_bin_edges, phi_bin_edges = bod.bin_edges
    theta_bins = np.trunc(theta / (2 * np.pi) * num_theta_bins).astype(int)
    phi_bins = np.trunc(phi / np.pi * num_phi_bins).astype(int)
    view = bod.bond_order[theta_bins, phi_bins]
    view[r2 > 1] = np.nan
    return view


def to_image(arr, cmap="afmhot", vmin=0, vmax=None):
    import matplotlib.colors
    import matplotlib.pyplot
    if vmax is None:
        vmax = np.nanmax(arr)
    norm = matplotlib.colors.Normalize(vmin=vmin, vmax=vmax, clip=True)
    cmap = matplotlib.pyplot.get_cmap(cmap)
    image = cmap(norm(arr))
    return (image * 255).astype(np.uint8)


def render(
    args,
    bins: Tuple[int] = (100, 100),
    mode: str = "bod",
    neighbors: dict = {"r_max": 1.4},
    image_size: int = 150,
    draw_x: float = 10,
    draw_y: float = 10,
):
    """Render a bond order diagram that rotates with the view.

    Args:
        args:
            OVITO viewport modifier arguments.
        bins:
            Passed to freud.environment.BondOrder.
        mode:
            Passed to freud.environment.BondOrder.
        neighbors:
            Passed to freud.environment.BondOrder.compute. It is recommended
            to use a cutoff distance at the first trough of the radial
            distribution function g(r). See
            https://freud.readthedocs.io/en/latest/topics/querying.html for
            more information.
        image_size:
            Rendered size of the bond order diagram.
        draw_x:
            X coordinate of the top-left corner of the drawn image.
        draw_y:
            Y coordinate of the top-left corner of the drawn image.

    """
    pipeline = args.scene.selected_pipeline
    if not pipeline:
        return
    data = pipeline.compute(args.frame)
    view_orientation = rowan.from_matrix(args.viewport.viewMatrix[:, :3])
    bod = freud.environment.BondOrder(bins, mode)
    bod.compute(system=data, neighbors=neighbors)
    view = to_view(bod, view_orientation, image_size)
    buf = to_image(view, cmap="afmhot")
    width, height, bytes_per_pixel = buf.shape
    img = PySide6.QtGui.QImage(
        buf,
        width,
        height,
        width * bytes_per_pixel,
        PySide6.QtGui.QImage.Format_RGBA8888,
    )
    # Paint QImage onto viewport canvas
    args.painter.drawImage(draw_x, draw_y, img)
```
    
    
    
