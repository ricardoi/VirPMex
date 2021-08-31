#!bin/bash

# Hybrid assembly using Sanger and Illumina sequences

##note: change .ab1 format to .fastq with emboss tools
 #seqret -sformat abi -osformat fastq -auto -stdout -sequence input.ab1 > output.fastq
 #execute the loop for multi .ab1 
sh abi2fastq.sh # search in scripts

# load spades on hipergator
module load spades

spades.py --pe1-1 RNAseq/LS1TO1SS03_S3_L001_R1_001.fastq.gz \
          --pe1-2 RNAseq/LS1TO1SS03_S3_L001_R2_001.fastq.gz \
          --s1 Sanger/ToBRFV_Sanger_reads_to.fastq \
          --metaviral -out ToBRFV_spades_output
date;
