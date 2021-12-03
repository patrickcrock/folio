#!/bin/bash


#SBATCH --partition=physical
#SBATCH --nodes=1
#SBATCH --job-name="mlst"
#SBATCH --account="punim1209"
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mail-user=pcrock@student.unimelb.edu.au
#SBATCH --mail-type=FAIL
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END

# runtime
#SBATCH --time=0-0:30:00

# check that the script is launched with sbatch
if [ "x$SLURM_JOB_ID" == "x" ]; then
   echo "You need to submit your job to the queuing system with sbatch"
   exit 1
fi

# The modules to load:
module load anaconda3/5.3.0
module load web_proxy/1.0

# The job command(s):
source activate mlst
mlst --scheme saureus --csv *.fa > mlst.csv