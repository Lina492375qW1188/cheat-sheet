Monitor CPU usage:
```
sreport cluster AccountUtilizationByUser -t hour user=$USER --tres cpu start=2022-10-01
```

Monitor GPU usage:
```
sreport cluster AccountUtilizationByUser -t hour user=$USER --tres gres/gpu start=2022-10-01
```

---
CPU job file example:
```
#!/bin/bash

#SBATCH --job-name=test
#SBATCH --account=<available account>
#SBATCH --mail-user=<email>
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=8
#SBATCH --partition=standard
#SBATCH --time=00:20:00

mpirun -n 8 python3 equilibriate.py
```

GPU job file example:
```
#!/bin/bash

#SBATCH --job-name=test
#SBATCH --gres=gpu:1
#SBATCH --ntasks-per-gpu=1
#SBATCH --time=01:00:00
#SBATCH --partition=gpu

module load gcc/10.3.0 openmpi/4.1.6 singularity

software_dir=<Directory to software.sif>

mpirun -n 1 singularity exec --nv ${software_dir}$/software.sif python3 equilibriate.py
```
