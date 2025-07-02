Starting from Catalina, mac OS uses zsh as default cell.
If using zsh and it hasn't been set up to read .bashrc, add miniconda directory to zsh shell PATH environment via
```
export PATH="/Users/suntingt/miniconda/bin:$PATH"
source /Users/my_username/opt/anaconda3/bin/activate // check my_username by $echo USER
conda init zsh // or conda init
```
Check whether it works using `conda list`


Project-patchy
```
conda create -n patchy
conda activate patchy
conda install mamba -c conda-forge
mamba install python=3.9 numpy matplotlib jupyterlab notebook -c conda-forge
mamba install pybind11 eigen cmake qhull pytest -c conda-forge
pip install PySide6

(HOOMD-blue version 3.9.0 for now)
mamba install hoomd freud fresnel -c conda-forge
mamba install signac signac-flow -c conda-forge
mamba install gsd -c conda-forge
mamba install coxeter -c conda-forge

mamba install scikit-learn -c intel
mamba install pytorch torchvision -c pytorch
mamba install ipywidgets -c conda-forge

mamba install umap-learn -c conda-forge

conda deactivate
```

Project-gnn
```
conda create -n gnn
conda activate gnn
conda install mamba -c conda-forge
mamba install python=3.9 numpy matplotlib jupyterlab notebook -c conda-forge
mamba install pybind11 eigen cmake qhull pytest -c conda-forge
pip install PySide6

mamba install hoomd freud fresnel -c conda-forge
mamba install signac signac-flow -c conda-forge
mamba install gsd -c conda-forge
mamba install coxeter -c conda-forge

mamba install scikit-learn -c intel
mamba install pytorch torchvision -c pytorch
mamba install ipywidgets -c conda-forge

conda install -y clang_osx-arm64 clangxx_osx-arm64 gfortran_osx-arm64

# Test on MACOSX-M1 version 12.6
MACOSX_DEPLOYMENT_TARGET=12.6 CC=clang CXX=clang++ python -m pip --no-cache-dir  install  torch-scatter -f https://data.pyg.org/whl/torch-1.13.1+${cpu}.html

MACOSX_DEPLOYMENT_TARGET=12.6 CC=clang CXX=clang++ python -m pip --no-cache-dir  install  torch-sparse -f https://data.pyg.org/whl/torch-1.13.1+${cpu}.html

MACOSX_DEPLOYMENT_TARGET=12.6 CC=clang CXX=clang++ python -m pip --no-cache-dir  install  torch-geometric

MACOSX_DEPLOYMENT_TARGET=12.6 CC=clang CXX=clang++ python -m pip --no-cache-dir install dgl -f https://data.dgl.ai/wheels/repo.html
```

Project-alchemy
```
conda create -n alchemy
conda activate alchemy
conda install mamba -c conda-forge
mamba install python numpy matplotlib jupyterlab notebook -c conda-forge
mamba install pybind11 eigen cmake qhull pytest -c conda-forge
pip install PySide6

git clone --recursive https://github.com/glotzerlab/hoomd-blue
cmake -B build/hoomd -S hoomd-blue
cmake --build build/hoomd
cmake --install build/hoomd

mamba install freud fresnel -c conda-forge
mamba install signac signac-flow -c conda-forge
mamba install gsd -c conda-forge
mamba install coxeter -c conda-forge

mamba install ipywidgets -c conda-forge

conda deactivate
```

Project-nnff
```
conda create -n nnff
conda activate nnff
conda install mamba -c conda-forge
mamba install python numpy matplotlib jupyterlab notebook -c conda-forge
mamba install pybind11 eigen cmake qhull pytest -c conda-forge
pip install PySide6

mamba install hoomd freud fresnel -c conda-forge
mamba install signac signac-flow -c conda-forge
mamba install gsd -c conda-forge
mamba install coxeter -c conda-forge

mamba install scikit-learn -c intel
mamba install pytorch torchvision -c pytorch
mamba install ipywidgets -c conda-forge

conda deactivate
```

Project-metad
```
conda create -n metad
conda activate metad
conda install mamba -c conda-forge
mamba install python numpy matplotlib jupyterlab=4.0.7 notebook -c conda-forge
mamba install pybind11 eigen cmake qhull pytest -c conda-forge
mamba install conda-forge::pyside6

mamba install hoomd freud fresnel -c conda-forge
mamba install signac signac-flow -c conda-forge
mamba install gsd -c conda-forge
mamba install coxeter -c conda-forge

mamba install ipywidgets -c conda-forge
mamba install anaconda::scikit-learn
mamba install pytorch torchvision -c pytorch
mamba install anaconda::pandas
mamba install -c conda-forge ffmpeg
mamba install -c conda-forge pyscal3

conda deactivate
```

Update on Feb 22, 2023:

package scikit-learn-0.24.2-py39h9197a36_1 requires python >=3.9,<3.10.0a0
