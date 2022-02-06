Cut `.xtc`
```
gmx_mpi trjconv -f md.xtc -b 0 -e 100000 -o md_short.xtc
gmx_mpi trjconv -f md.xtc -b 0 -e 20000 -o md_20ns.xtc
```
