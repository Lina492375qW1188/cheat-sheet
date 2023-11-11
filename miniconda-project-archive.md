The following projects are archived. Some of them require old version of packages, e.g. python 3.7, numpy 17.x.

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

Project-plumed
```
conda create -n plumed

conda activate plumed
conda install mamba -c conda-forge
mamba install -c conda-forge plumed

conda deactivate
```
