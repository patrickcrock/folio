#!/bin/bash
# Created by the University of Melbourne job script generator for SLURM
# Fri Jun 11 2021 15:49:02 GMT+1000 (Australian Eastern Standard Time)

# Partition for the job:
#SBATCH --partition=physical

# Multithreaded (SMP) job: must run on one node 
#SBATCH --nodes=1

# The name of the job:
#SBATCH --job-name="main_pregubb_fasttree"

# The project ID which this job should run under:
#SBATCH --account="punim1209"

# Maximum number of tasks/CPU cores used by the job:
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=121440

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
#SBATCH --time=1-18:0:00

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
module load bedtools/2.27.1
module load minimap2/2.13
module load snp-sites/2.4.1
module load bioperl/1.6.924-perl-5.30.0
module load python/3.8.6
module load biopython/1.74
module load dendropy/4.4.0
module load pillow/6.2.1
module load fasttree/2.1.10
module load raxml/8.2.12-pthreads-sse3
module load gubbins/2.4.0

# The job command(s):
project=/data/gpfs/projects/punim1209
reference=${project}/MSHR1132.gbk

echo "------------------------running fasttree------------------------"

fasttree -gtr -nt core.full.aln > pregubbins_full_fasttree.nwk
