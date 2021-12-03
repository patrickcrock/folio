#!/bin/bash
# Created by the University of Melbourne job script generator for SLURM
# Wed Aug 18 2021 15:54:11 GMT+1000 (Australian Eastern Standard Time)

# Partition for the job:
#SBATCH --partition=physical

# Multithreaded (SMP) job: must run on one node 
#SBATCH --nodes=1

# The name of the job:
#SBATCH --job-name="full_iqtree"

# The project ID which this job should run under:
#SBATCH --account="punim1209"

# Maximum number of tasks/CPU cores used by the job:
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12



# Use this email address:
#SBATCH --mail-user=pcrock@student.unimelb.edu.au

# Send yourself an email when the job:
# aborts abnormally (fails)
#SBATCH --mail-type=FAIL
# begins
#SBATCH --mail-type=BEGIN
# ends successfully
#SBATCH --mail-type=END

# The maximum running time of the job in days-hours:mins:sec
#SBATCH --time=0-04:00:00

# check that the script is launched with sbatch
if [ "x$SLURM_JOB_ID" == "x" ]; then
   echo "You need to submit your job to the queuing system with sbatch"
   exit 1
fi

# Run the job from the directory where it was launched (default)

# The modules to load:
module load anaconda3/5.3.0
module load web_proxy/1.0

# The job command(s):
source activate iqtree

# within conda environment:
iqtree -s masked_core.aln -m GTR+F+G4 -B 1000 -alrt 1000 -v -T 12 -fconst 725210,343593,345795,724600