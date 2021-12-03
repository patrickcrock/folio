#!/bin/bash
# Created by the University of Melbourne job script generator for SLURM
# Fri Jun 11 2021 15:49:02 GMT+1000 (Australian Eastern Standard Time)

# Partition for the job:
#SBATCH --partition=physical

# Multithreaded (SMP) job: must run on one node 
#SBATCH --nodes=1

# The name of the job:
#SBATCH --job-name="snippy_ctgs"

# The project ID which this job should run under:
#SBATCH --account="punim1209"

# Maximum number of tasks/CPU cores used by the job:
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16



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
#SBATCH --time=0-2:0:00

# check that the script is launched with sbatch
if [ "x$SLURM_JOB_ID" == "x" ]; then
   echo "You need to submit your job to the queuing system with sbatch"
   exit 1
fi

# Run the job from the directory where it was launched (default)

# The modules to load:
module load gcc/8.3.0
module load openmpi/3.1.4
module load snippy/4.6.0-perl-5.30.0
module load java/11.0.2
module load seqtk/1.3
module load vt/0.57721
module load samtools/1.9

# The job command(s):
for file in *.fa
do
	N=${file%.fa}
	echo '-------- Base calling "$N" --------'
	echo '-------- Output base filename will be '$N'_SNPs --------'
	snippy --outdir "$N"_SNPs --ref MSHR1132.gbk --ctgs "$N".fa --cpus 16
	echo '-------- Base calling completed for '$file' --------'
done
