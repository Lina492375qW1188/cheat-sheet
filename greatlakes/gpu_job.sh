#!/bin/bash

#SBATCH --job-name=test
#SBATCH --gres=gpu:1
#SBATCH --ntasks-per-gpu=1
#SBATCH --time=01:00:00
#SBATCH --partition=gpu

module load gcc/10.3.0 openmpi/4.1.6 singularity

software_dir=<Directory to software.sif>

mpirun -n 1 singularity exec --nv ${software_dir}$/software.sif python3 <filename>.py
