#! /bin/bash
#cutadapt

cutadapt -u 50 -U -50 -o Cplus_RNA_1_100.fastq -p Cplus_RNA_2_100.fastq Cplus_RNA_1.fastq Cplus_RNA_2.fastq --minimum-length 50 --trim-n
