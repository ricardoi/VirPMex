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

# Assigning variables 
HOST=$1 # Add the PATH to the genome sample
R1=$2 # Add reads 1 in fastq.gz
R2=$3 # Add reads 2 in fastq.gz
OUTNAME=$4 # Add the name identifier, p.ex. Papaya

# Remove Host Sequence from Viromes
# Tutorial http://www.metagenomics.wiki/tools/samtools/remove-host-sequences

# Map Illumina reads againt host genome sequence
# with bowtie2 https://www.nature.com/articles/nmeth.1923
module load bowtie2 samtools bedtools

# Index your Host file 
bowtie2-build genome.fna ${HOST} # takes about several minutes

# Mapping reads to the Host genome 
bowtie2 -x ${HOST} -1 ${R1} -2 ${R2} -S ${OUTNAME}_mapped_and_unmapped.sam
samtools view -bS ${OUTNAME}_mapped-unmapped.sam > ${OUTNAME}_mapped-unmapped.bam

# Filter unmapped reads
samtools view -b -f 12 -F 256 ${OUTNAME}_mapped-unmapped.sam > ${OUTNAME}_bothpairs_unmapped.bam

# Split pair-end reads into separated fastq files...
samtools sort -n ${OUTNAME}_both-pairs_unmapped.bam -o ${OUTNAME}_both-pairs_unmapped_sorted.bam 
bedtools bamtofastq -i ${OUTNAME}_both-pairs_unmapped_sorted.bam -fq ${OUTNAME}_filtered.r1.fastq -fq2 ${OUTNAME}_filtered.r2.fastq

date;
