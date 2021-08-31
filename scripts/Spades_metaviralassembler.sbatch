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

# Hybrid assembly using Sanger and Illumina sequences
##tip: change .ab1 format to .fastq with emboss tools

# load spades on hipergator
module load spades

spades.py --pe1-1 RNAseq/LS1TO1SS03_S3_L001_R1_001.fastq.gz \
          --pe1-2 RNAseq/LS1TO1SS03_S3_L001_R2_001.fastq.gz \
          --s1 Sanger/ToBRFV_Sanger_reads_to.fastq \
          --metaviral -out ToBRFV_spades_output
date;
