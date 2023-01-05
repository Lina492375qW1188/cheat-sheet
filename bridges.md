```
#!/bin/bash
#SBATCH -t 03:30:00
#SBATCH -N 1
#SBATCH --partition=GPU-shared
#SBATCH --gres=gpu:1
#SBATCH --job-name="ps-LSTM0"

singularity exec /ocean/containers/ngc/pytorch/pytorch_latest.sif python3 -u ps-LSTM_ops.py
```

CPU job file example:

```
#!/bin/bash
#SBATCH --job-name=moment-inertia
#SBATCH --time=00:20:00
#SBATCH --partition=RM-shared
#SBATCH -N 1
#SBATCH --ntasks-per-node 2

module load openmpi/4.0.5-gcc10.2.0

singularity exec --bind /ocean $PROJECT/software.sif python3 project_init.py
mpirun -n 2 singularity exec --bind /ocean $PROJECT/software.sif python3 project_run.py
```


GPU job file example:

```
#!/bin/bash
  
#SBATCH --job-name=moment-inertia
#SBATCH --time=00:20:00
#SBATCH --partition=GPU-shared
#SBATCH --gres=gpu:1
#SBATCH --ntasks-per-gpu=1

module load openmpi/4.0.5-gcc10.2.0

singularity exec --bind /ocean $PROJECT/software.sif python3 project_init.py
mpirun -n 1 singularity exec --bind /ocean --nv $PROJECT/software.sif python3 project_run.py
```

