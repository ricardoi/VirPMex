#!/bin/bash
#SBATCH --account=epi
#SBATCH --qos=epi
#SBATCH --job-name=Spades
#SBATCH --mail-type=ALL
#SBATCH --mail-user=ralcala@ufl.edu
#SBATCH --ntasks=12
#SBATCH --cpus-per-task=3
#SBATCH --mem=32gb
#SBATCH --time=48:00:00
#SBATCH --output=Spades_%j.out
date; hostname; pwd

module load ufrc spades

# vars
reads1=$1 #$ PATH/to/READ1
reads2=$2 #$ PATH/to/READ2
# Paired-end Illumina sequence assembly
# load spades on hipergator
module load spades

spades.py --pe1-1 ${reads1}\
          --pe1-2 ${reads2}\
          --metaviral -o Spades_%j_output

#spades.py --pe1-1 reads_bu/S25_R1.fastq.gz\
#          --pe1-2 reads_bu/S25_R2.fastq.gz \
#          --metaviral -o bulk2_spades_output

date;
