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

Project-scraper
```
conda create -n scraper
conda activate scraper
conda install mamba -c conda-forge
mamba install python numpy matplotlib jupyterlab notebook -c conda-forge
mamba install anaconda::beautifulsoup4
mamba install mechanicalsoup -c conda-forge

conda deactivate
```


# Install LAMMPS with PLUMED
### Mac os arm64, using cmake and traditional patching way (deprecated after plumed-2.4.8)
I've tried this method on bridges2 but failed, but it works on local pc.
1. First prepare a conda environment for LAMMPS and PLUMED
```
conda create -n lammps
conda activate lammps

conda install mamba -c conda-forge
mamba install python numpy matplotlib jupyterlab notebook -c conda-forge
mamba install cmake -c conda-forge
mamba install conda-forge::gsl
```

2. Create a directory for lammps and unzip LAMMPS and PLUMED tarball.
```
mkdir lammps_plumed
tar -xvzf lammps*
tar -xvzf plumed*
```

3. Build PLUMED first
```
cd plumed*/
./configure --prefix=[My_Path]
./configure --prefix=[My_Path] --enable-mpi CXX="$MPICXX" # if installed with MPI
make -j 4
make install
source source.sh # To have PLUMED in PATH variable.
```

4. Go to LAMMPS folder and patch with PLUMED.
```
plumed patch -p
```
There should be options showing up. Choosing the appropriate option for patching with LAMMPS.

5. Build LAMMPS with cmake
```
cd lammps*/
mkdir build; cd build
cmake ../cmake -D PKG_PLUMED=yes
cmake --build .
```
