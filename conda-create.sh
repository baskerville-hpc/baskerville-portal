#!/bin/bash
#SBATCH --account myproject
#SBATCH --qos myqueue
#SBATCH --time 01:00:00
#SBATCH --nodes 1
#SBATCH --gpus 1
#SBATCH --cpus-per-gpu 36

# Module loading
module purge # unloads and loaded modules and resets the environment
module load baskerville # loads the default Baskerville environment 
module load bask-apps/live # load the stable, default application stack
module load Miniconda3/4.10.3 # load the Conda package manager

set -e # exit immediately if there is an error
eval "$(${EBROOTMINICONDA3}/bin/conda shell.bash hook)" # initialise Conda

# Conda environment

# Define the path to your Conda environment (modify as appropriate)
# N.B. the environment directory's name must be lowercase only
# N.B. this path will be created by the subsequent commands if it doesn't already exist
export CONDA_ENV_PATH="/bask/projects/m/myproject/my_conda_env"

export CONDA_PKGS_DIRS=/tmp # Download packages to temporary storage

# Create the environment. Only required once.
conda create --yes --prefix "${CONDA_ENV_PATH}"
# Activate the environment
conda activate "${CONDA_ENV_PATH}"
# Choose your version of Python
conda install --yes python=3.10

# Continue to install any further items as required.
# For example:
conda install --yes numpy