Building miniconda environment via mamba

To deactivate conda base environment at start of terminal, type:
```
conda config --set autoactivate_base flase
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
mamba install python=3.7 numpy matplotlib jupyterlab=3.1.7 notebook -c conda-forge
mamba install scipy -c conda
mamba install scikit-learn -c intel
mamba install -c pytorch pytorch
mamba install pyemma -c conda-forge
mamba install qutip -c conda-forge
conda deactivate
```

Project-patchy
```
conda create -n patchy
conda activate patchy
conda install mamba -c conda-forge
mamba install python=3.7 numpy matplotlib jupyterlab=3.1.7 notebook -c conda-forge

mamba install pybind11 -c conda-forge
mamba install eigen -c conda-forge
mamba install cmake -c conda-forge
mamba install qhull -c conda-forge
mamba install pyside2 -c conda-forge
mamba install pillow -c conda-forge
mamba install pytest -c conda-forge

mamba install hoomd -c conda-forge
mamba install freud -c conda-forge
mamba install fresnel -c conda-forge
mamba install gsd -c conda-forge
mamba install scikit-learn -c intel
mamba install scipy -c conda
mamba install -c pytorch pytorch
mamba install pyg -c pyg

mamba install -n base -c conda-forge widgetsnbextension
mamba install -n py36 -c conda-forge ipywidgets
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


Project-patchy-mi
```
conda create -n patchy
conda activate patchy
conda install mamba -c conda-forge
mamba install python numpy matplotlib jupyterlab notebook -c conda-forge

mamba install pybind11 -c conda-forge
mamba install eigen -c conda-forge
mamba install cmake -c conda-forge
mamba install qhull -c conda-forge
mamba install pyside2 -c conda-forge
mamba install pillow -c conda-forge
mamba install pytest -c conda-forge

mamba install hoomd -c conda-forge
mamba install freud -c conda-forge
mamba install fresnel -c conda-forge
mamba install -c conda-forge signac signac-flow
mamba install gsd -c conda-forge
mamba install scikit-learn -c intel
mamba install scipy -c conda
mamba install -c pytorch pytorch
mamba install pyg -c pyg
mamba install pandas

mamba install -n base -c conda-forge widgetsnbextension
// mamba install -n py36 -c conda-forge ipywidgets
conda deactivate
```


Remove environment: 
```
conda env remove -n [env_name]
```
