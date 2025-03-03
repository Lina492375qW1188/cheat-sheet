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
#SBATCH --mail-user=suntingt@umich.edu
#SBATCH --cpus-per-task=1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=01:00:00
#SBATCH --partition=standard

module load gcc/10.3.0 openmpi/4.1.6 singularity

mpirun -n 1 singularity exec /scratch/sglotzer_root/sglotzer0/suntingt/software.sif python3 equilibriate.py
```

GPU job file example:
```
#!/bin/bash

#SBATCH --job-name=test
#SBATCH --mail-user=suntingt@umich.edu
#SBATCH --gres=gpu:1
#SBATCH --ntasks-per-gpu=1
#SBATCH --time=01:00:00
#SBATCH --partition=gpu

module load gcc/10.3.0 openmpi/4.1.6 singularity

mpirun -n 1 singularity exec --nv /scratch/sglotzer_root/sglotzer0/suntingt/software.sif python3 equilibriate.py
```
