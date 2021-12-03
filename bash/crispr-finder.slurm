#!/bin/bash
#SBATCH --partition=physical,snowy
#SBATCH --job-name="CRISPRcas-finder"
#SBATCH --account="punim1209"
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=100G
#SBATCH --time=0-00:10:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=pcrock@student.unimelb.edu.au

### USAGE ###
# Give .txt file with file(s) to be examined
# Give full path to file(s) that should be examined.
# Give full path to where output files should be dropped


## Time stamp ##
echo "This was run on $(date)"


# The modules to load:
module load gcc/8.3.0
module load singularity/3.6.3



# Commands
# Move to CRISPRcas folder
cd /data/gpfs/projects/punim1209/CRISPRcas-finder

# Make output folder
if [ -d $3 ]
then
    echo "Output folder exists"
else
    mkdir $3
fi

# Get file to examine
file=${1:-DEFAULTVALUE}
# Set file to be searched as variable by extracting the name by line index
fasta=$(cat ${file} | sed -n ${SLURM_ARRAY_TASK_ID}p)

# Copy file to CRISPRcas folder
cp ${2}$fasta .

# Set the output file name as variable
out_file=$(echo $fasta | cut -d'.' -f 1)

# Singularity and CRISPRcas-finder code
singularity exec -B $PWD CrisprCasFinder.simg \
perl /usr/local/CRISPRCasFinder/CRISPRCasFinder.pl \
-so /usr/local/CRISPRCasFinder/sel392v2.so \
-cf /usr/local/CRISPRCasFinder/CasFinder-2.0.3 \
-drpt /usr/local/CRISPRCasFinder/supplementary_files/repeatDirection.tsv \
-rpts /usr/local/CRISPRCasFinder/supplementary_files/Repeat_List.csv \
-cas -def G \
-out ${out_file} \
-in ${fasta}

# Move result to result folder
mv $out_file ${3}

# Remove fasta copied fasta file
rm $fasta