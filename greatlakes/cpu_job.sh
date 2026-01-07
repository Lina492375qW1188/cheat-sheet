#!/bin/bash

#SBATCH --job-name=test
#SBATCH --cpus-per-task=1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=01:00:00
#SBATCH --partition=standard

module load gcc/10.3.0 openmpi/4.1.6 singularity

software_dir=<Directory to software.sif>

mpirun -n 1 singularity exec ${software_dir}$/software.sif python3 <filename>.py
