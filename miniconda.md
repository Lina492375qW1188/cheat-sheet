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


Starting from Catalina, mac OS uses zsh as default cell.
If using zsh and it hasn't been set up to read .bashrc, add miniconda directory to zsh shell PATH environment via
```
export PATH="/Users/suntingt/miniconda/bin:$PATH"
source /Users/my_username/opt/anaconda3/bin/activate // check my_username by $echo USER
conda init zsh // or conda init
```
Check whether it works using `conda list`


Example miniconda project installing HOOMD from source
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
mamba install -c conda-forge yapf

conda deactivate
```


Remove environment: 
```
conda env remove -n [env_name]
```

Update on Feb 22, 2023:

package scikit-learn-0.24.2-py39h9197a36_1 requires python >=3.9,<3.10.0a0
