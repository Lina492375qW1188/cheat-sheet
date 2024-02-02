PLUMED on bridges2
```
/jet/packages/spack/opt/spack/linux-centos8-zen2/gcc-10.2.0/plumed-2.6.1-k62ifixvl6p64x42c5wd3rjcvhhozwbf/bin/plumed driver --mf_xtc md_40ns.xtc --plumed plumed_water.dat
```

Build PLUMED on bridges2
```
./configure --prefix=[My_Path] --enable-mpi CXX="$MPICXX"
make -j 4
make install
```

To remove PLUMED, remove
```
/usr/local/bin/plumed*
/usr/local/include/plumed

/usr/local/lib/plumed
/usr/local/lib/pkgconfig/plumed*
/usr/local/lib/libplumed*
```
