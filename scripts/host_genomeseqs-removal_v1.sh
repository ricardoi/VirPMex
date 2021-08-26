#! /bin/bash
#Remove host working
#Tutorial http://www.metagenomics.wiki/tools/samtools/remove-host-sequences
#bowtie2-build ABIM01.1.nt.fsa Cpapaya
bowtie2 -x /home/ricardoi/Data/MetagenomicaVirusPapaya/Papayomics_NGS/Maize_genoma/Zmaize_b73 -1 S24_R1.fastq.gz -2 S24_R2.fastq.gz -S SAMPLE_mapped_and_unmapped.sam
samtools view -bS SAMPLE_mapped_and_unmapped.sam > SAMPLE_mapped_and_unmapped.bam
samtools view -b -f 12 -F 256 SAMPLE_mapped_and_unmapped.bam > SAMPLE_bothEndsUnmapped.bam
samtools sort -n SAMPLE_bothEndsUnmapped.bam SAMPLE_bothEndsUnmapped_sorted 
bedtools bamtofastq -i SAMPLE_bothEndsUnmapped_sorted.bam -fq S24_r1_nh.fastq -fq2 S24_r2_nh.fastq