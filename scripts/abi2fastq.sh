#!bin/bash

# EMBOSS tools 
module load emboss

# process all ab1 files to fastq and concatenate as multi-fastq

files=$(ls *.ab1 | cut -d. -f1)

while IFS= read -r file
do
 seqret -sformat abi -osformat fastq -auto -stdout -sequence $file.ab1 > $file.fastq
done <<< "$files"

cat *.fastq > Sanger_reads_to.fastq
