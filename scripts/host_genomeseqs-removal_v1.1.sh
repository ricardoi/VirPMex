#!/bin/bash
#SBATCH --account=epi
#SBATCH --qos=epi
#SBATCH --job-name=host_rm  #Job name
#SBATCH --mail-type=ALL   # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=ralcala@ufl.edu  # Where to send mail
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=16gb   # Per processor memory
#SBATCH --time=60:00:00   # Walltime
#SBATCH --output=host_rm_%j.out   # Name output file
date; hostname; pwd

#Remove host working
#Tutorial http://www.metagenomics.wiki/tools/samtools/remove-host-sequences

module load bowtie2 samtools bedtools

# Assigning variables 
HOST=$1 # Add the PATH to the genome sample
R1=$2 # Add reads 1 in fastq.gz
R2=$3 # Add reads 2 in fastq.gz
OUTNAME=$4 # Add the name identifier, p.ex. Papaya

# Commands
bowtie2-build ${HOST} ${OUTNAME}_${HOST} 

bowtie2 -x ${OUTNAME}_${HOST} -1 ${R1} -2 ${R2} -S ${OUTNAME}_mapped-unmapped.sam
samtools view -bS ${OUTNAME}_mapped-unmapped.sam > ${OUTNAME}_mapped-unmapped.bam
samtools view -b -f 12 -F 256 ${OUTNAME}_mapped-unmapped.bam > ${OUTNAME}_bothpairs-unmapped.bam
samtools sort -n ${OUTNAME}_bothpairs-unmapped.bam ${OUTNAME}_bothpairs-unmapped_sorted.sam
bedtools bamtofastq -i ${OUTNAME}_bothEndsUnmapped_sorted.bam -fq ${OUTNAME}_${R1} -fq2 ${OUTNAME}_${R2}

date
