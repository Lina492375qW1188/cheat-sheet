Install Ovito Pro on M1
Python script plugin `ovitos` is in `\Applications/Ovito.app/Contents/MacOS/`.
Changing path of `ovitos` to `export PATH="/Applications/Ovito.app/Contents/MacOS/:$PATH"`, then run 
```
ovitos -m pip install freud-analysis
```

To install `torch-geometric` and `dgl` with ovitos, must upgrad ovitos pip to version `23.1.2` with
```
/Applications/Ovito.app/Contents/MacOS/Ovito.app/Contents/MacOS/ovitos -m pip install --upgrade pip
```
then install `torch-geometric` with
```
ovitos -m pip --no-cache-dir  install  torch-scatter -f https://data.pyg.org/whl/torch-1.13.1+${cpu}.html
ovitos -m pip --no-cache-dir  install  torch-sparse -f https://data.pyg.org/whl/torch-1.13.1+${cpu}.html\
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


Viewport layers
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
    
    
    
