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

Or build PLUMED first and link LAMMPS to PLUMED
```
cd plumed*/
PATH_TO_PLUMED=/usr/local/ # Example
./configure --prefix=${PATH_TO_PLUMED}
./configure --prefix=${PATH_TO_PLUMED} \
            --enable-mpi CXX="$MPICXX" \ # if installed with MPI
            --enable-modules=+crystallization # if installed with crystallization module
make -j 4
make install
source source.sh # To have PLUMED in PATH variable.

cd lammps*/src/
make lib-plumed args="-p ${PATH_TO_PLUMED} -m shared"
make yes-plumed
make yes-extra-fix
make yes-extra-dump
make mpi # or make serial if no MPI installed.
```


