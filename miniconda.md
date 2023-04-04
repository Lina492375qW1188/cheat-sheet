Building miniconda environment via mamba

To deactivate conda base environment at start of terminal, type:
```
conda config --set auto_activate_base false
```

`-c`: channel, different packages are uploaded to different channels in conda. For example, conda-forge and conda are two different channels.
`conda list`: List conda package
`conda env list`: List environments.


Environment:

1. After installing miniconda, we have the base environment.
2. Install the mamba in the base environment, `conda install -c conda-forge mamba`

Create other environment:

```
conda create -n [env_name]
conda install -c conda-forge mamba
mamba install other things -c [channel]
```

My environment:
Project-SGOOP
```
conda create -n sgoop
conda activate sgoop
conda install mamba -c conda-forge
mamba install python=3.7 numpy matplotlib jupyterlab=3.1.7 notebook -c conda-forge
mamba install scipy -c conda
mamba install scikit-learn -c intel
mamba install pyemma -c conda-forge
conda deactivate
```

Project-LSTM
```
conda create -n lstm
conda activate lstm
conda install mamba -c conda-forge
mamba install python numpy matplotlib jupyterlab notebook -c conda-forge
mamba install scipy -c conda
mamba install scikit-learn -c intel
mamba install -c pytorch pytorch
mamba install pyemma -c conda-forge
mamba install qutip -c conda-forge
conda deactivate
```

Project-quantum-jump
```
conda create -n quantum-jump
conda activate quantum-jump
conda install mamba -c conda-forge
mamba install python numpy matplotlib jupyterlab notebook -c conda-forge
mamba install pybind11 eigen cmake qhull pytest -c conda-forge
conda install pandas -c anaconda

mamba install signac signac-flow -c conda-forge

mamba install scikit-learn -c intel
mamba install pytorch torchvision -c pytorch
mamba install ipywidgets -c conda-forge

mamba install qutip -c conda-forge

conda deactivate
```


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
```

Project-alchemy
```
conda create -n alchemy
conda activate alchemy
conda install mamba -c conda-forge
mamba install python=3.9 numpy matplotlib jupyterlab notebook -c conda-forge
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


Project-patchy
```
conda create -n patchy
conda activate patchy
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

mamba install umap-learn -c conda-forge

conda deactivate
```



Remove environment: 
```
conda env remove -n [env_name]
```

Update on Feb 22, 2023:

package scikit-learn-0.24.2-py39h9197a36_1 requires python >=3.9,<3.10.0a0
