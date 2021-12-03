#!/bin/bash
# Created by the University of Melbourne job script generator for SLURM
# Fri May 14 2021 14:33:55 GMT+1000 (Australian Eastern Standard Time)

# Partition for the job:
#SBATCH --partition=physical

# Multithreaded (SMP) job: must run on one node 
#SBATCH --nodes=1

# The name of the job:
#SBATCH --job-name="spades"

# The project ID which this job should run under:
#SBATCH --account="punim1209"

# Maximum number of tasks/CPU cores used by the job:
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=5



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
#SBATCH --time=0-1:0:00

# check that the script is launched with sbatch
if [ "x$SLURM_JOB_ID" == "x" ]; then
   echo "You need to submit your job to the queuing system with sbatch"
   exit 1
fi

# Run the job from the directory where it was launched (default)

# The modules to load:
module load spades/3.14.1-python-3.7.4

# The job command(s):

for file1 in *_1.fastq.gz
do
	file2=${file1/_1.fastq.gz/_2.fastq.gz}
	out=${file1%.*}_output
	echo '-------- Assembling '$file1' --------'
	spades.py -1 $file1 -2 $file2 -o $out -t 5 
	echo '-------- Assembly completed for '$file1' --------'
done