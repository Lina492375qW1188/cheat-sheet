Cut `.xtc`
```
gmx_mpi trjconv -f md.xtc -s md.tpr -b 0 -e 100000 -o md_short.xtc
gmx_mpi trjconv -f md.xtc -s md.tpr -b 0 -e 20000 -o md_20ns.xtc
```

Center `.xtc`
```
gmx_mpi trjconv -f name.xtc -s name.tpr -pbc mol -ur compact -center -o outputfile.xtc
```

Remove global rotational motion (alanine dipeptide):
```
gmx_mpi trjconv -s aladip.tpr -f aladip.trr -o aladip_no_rot.trr -fit rot
```

Create `.tpr` for umbrella sampling
```
module load gromacs/2020.2-cpu (example on bridges)
  
frame=$1
window=$2
Topology=argon.top
Parameters=LJ_md.mdp
InitialGeo=Ar_rho\=0.0004423_N\=512_cubic.pdb
Filename=md
TprFile=${Filename}_${window}.tpr

gmx_mpi grompp \
       -f ${Parameters}    \
       -c ${InitialGeo}    \
       -p ${Topology}      \
       -t md.trr           \
       -time ${frame}      \
       -o ${TprFile}
```
