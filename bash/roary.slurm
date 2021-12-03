#!/bin/bash
# first launch this in the directory with the off files to annotate 
# Created by the University of Melbourne job script generator for SLURM
# Mon Aug 12 2019 09:32:53 GMT+1000 (Australian Eastern Standard Time)


# Partition for the job:
#SBATCH --partition=physical


# Multithreaded (SMP) job: must run on one node and the cloud partition
#SBATCH --nodes=1


# The name of the job:
#SBATCH --job-name="argenteus_roary"


# The project ID which this job should run under:
#SBATCH --account="punim1209"


# Maximum number of tasks/CPU cores used by the job:
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12






# Send yourself an email when the job:
# aborts abnormally (fails)
#SBATCH --mail-type=FAIL
# begins
#SBATCH --mail-type=BEGIN
# ends successfully
#SBATCH --mail-type=END


# Use this email address:
#SBATCH --mail-user=pcrock@student.unimelb.edu.au


# The maximum running time of the job in days-hours:mins:sec
#SBATCH --time=0-0:25:00


# check that the script is launched with sbatch
if [ "x$SLURM_JOB_ID" == "x" ]; then
   echo "You need to submit your job to the queuing system with sbatch"
   exit 1
fi


# Run the job from the directory where it was launched (default)


# The modules to load:
module load gcc/8.3.0
module load openmpi/3.1.4
module load bedtools/2.27.1
module load cd-hit/4.8.1
module load blast+/2.9.0
module load mcl/14.137
module load parallel/20190922
module load prank/170427
module load mafft/7.453-with-extensions
module load fasttree/2.1.10
module load kraken2/2.0.8-beta-perl-5.30.0
module load roary/3.12.0-perl-5.30.0


# The job command(s):
pwd > /data/gpfs/projects/punim1209/MLST/gffs
ls > /data/gpfs/projects/punim1209/MLST/gffs
roary -p 12 -f ../roary -i 90 -s -a *.gff