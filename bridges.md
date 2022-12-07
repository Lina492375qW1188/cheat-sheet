#!/bin/bash
#SBATCH -t 03:30:00
#SBATCH -N 1
#SBATCH --partition=GPU-shared
#SBATCH --gres=gpu:1
#SBATCH --job-name="ps-LSTM0"

singularity exec /ocean/containers/ngc/pytorch/pytorch_latest.sif python3 -u ps-LSTM_ops.py
