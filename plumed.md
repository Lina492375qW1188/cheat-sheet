Build PLUMED on bridges2
```
./configure --prefix=[My_Path] --enable-mpi CXX="$MPICXX"
make -j 4
make install
```

To remove PLUMED, remove
```
[My_Path]/bin/plumed*
[My_Path]/include/plumed

[My_Path]/lib/plumed
[My_Path]/lib/pkgconfig/plumed*
[My_Path]/lib/libplumed*
```

Post-analysis
```
plumed driver --plumed plumed.dat --mf_pdb aladip.pdb
plumed driver --plumed plumed.dat --mf_xtc md.xtc
```
