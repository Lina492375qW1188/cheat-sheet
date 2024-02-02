There are many ways to build lammps with plumed support. Refer to `lammps*/lib/plumed/README` and `lammps/src/PLUMED` for more details.

# Bridges2
Building LAMMPS with PLUMED on bridges2 (`lammps*` means the LAMMPS folder):
```
cd lammps*/src/
make lib-plumed args="-b" # also check make lib-plumed for more options.
make yes-plumed
make yes-extra-fix
make yes-extra-dump
make mpi
```

Building LAMMPS with pre-built PLUMED
1. Build PLUMED (The following example also build PLUMED with MPI and crystallization packages enabled)
```
./configure  --prefix=[MY_PATH_TO_PLUMED] \
             --enable-mpi CXX="$MPICXX" \
             --enable-modules=+crystallization
make -j 4
make install
source source.sh # To have PLUMED in PATH variable.
```

2. Build LAMMPS
```
cd lammps*/src/
make lib-plumed args="-p [MY_PATH_TO_PLUMED] -m shared"
make yes-plumed
make yes-extra-fix
make yes-extra-dump
make mpi
```

# Mac os arm64 using make

```
cd lammps*/src/
make lib-plumed args="-b" # also check make lib-plumed for more options.
make yes-plumed
make yes-extra-fix
make yes-extra-dump # for dumping xtc, dcd ... file format.
make serial
```

# Mac os arm64, using cmake and traditional patching way (deprecated after plumed-2.4.8)
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
