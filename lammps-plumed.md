There are many ways to build lammps with plumed support. Refer to `lammps*/lib/plumed/README` and `lammps/src/PLUMED` for more details.

Build LAMMPS with PLUMED on bridges2:

```
cd lammps*/src/
make lib-plumed args="b"
make yes-plumed
make mpi
```

Build LAMMPS with PLUMED on mac os arm64, using cmake and traditional patching way (deprecated after plumed-2.4.8)

# First prepare a conda environment for LAMMPS and PLUMED
```
conda create -n lammps
conda activate lammps

conda install mamba -c conda-forge
mamba install python numpy matplotlib jupyterlab notebook -c conda-forge
mamba install cmake -c conda-forge
mamba install conda-forge::gsl
```

# Create a directory for lammps and unzip LAMMPS and PLUMED tarball.
```
mkdir lammps_plumed
tar -xvzf lammps*
tar -xvzf plumed*
```

# Build PLUMED first
```
cd plumed*/
./configure --prefix=[My_Path]
./configure --prefix=[My_Path] --enable-mpi CXX="$MPICXX" # if installed with MPI
make -j 4
make install
```

# Go to LAMMPS folder and patch with PLUMED.
```
plumed patch -p
```
There should be options showing up. Choosing the appropriate option for patching with LAMMPS.

# Build LAMMPS with cmake
```
cd lammps*/
mkdir build; cd build
cmake ../cmake -D PKG_PLUMED=yes
cmake --build .
```
