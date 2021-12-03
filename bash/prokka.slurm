#!/bin/bash
# first launch this in the directory with the off files to annotate
# Created by the University of Melbourne job script generator for SLURM
# Mon Aug 12 2019 09:32:53 GMT+1000 (Australian Eastern Standard Time)


# Partition for the job:
#SBATCH --partition=physical


# Multithreaded (SMP) job: must run on one node and the cloud partition
#SBATCH --nodes=1


# The name of the job:
#SBATCH --job-name="1850_prokka"


# The project ID which this job should run under:
#SBATCH --account="punim1209"


# Maximum number of tasks/CPU cores used by the job:
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1




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
#SBATCH --time=0-00:15:00
#SBATCH --array=1-76


# check that the script is launched with sbatch
if [ "x$SLURM_JOB_ID" == "x" ]; then
   echo "You need to submit your job to the queuing system with sbatch"
   exit 1
fi


# Run the job from the directory where it was launched (default)


# The modules to load:
module load prokka/1.14.5
module --ignore-cache load java/1.8.0_241


### will set the file name to the file that corresponds to that position in ls
### basically list all the files in directory with *.fa
### send that to sed which can isolate the line of the file (-n) 
### the line is specified by the task id variable which is the array number and then prints (p)
file_full=$(ls *.fa | sed -n ${SLURM_ARRAY_TASK_ID}p)


### remove any symlink mention if present
file=${file_full%:*}


prokka \
    --outdir /data/gpfs/projects/punim1209/MLST//${file%.fa} \
    --prefix ${file%.fa} --locustag ${file%.fa} \
    --genus Staphylococcus --species aureus --usegenus \
    --compliant --mincontiglen 500 --addgenes --cpus 12 \
    ${file}

