#Remove host machote
#Tutorial http://www.metagenomics.wiki/tools/samtools/remove-host-sequences

#Map againt host
#Cpapaya is going to be your index file 

bowtie2-build genome.fna Cpapaya

bowtie2 -x Cpapaya -1 Reads_1.fastq -2 Reads_2.fastq -S SAMPLE_mapped_and_unmapped.sam
samtools view -bS SAMPLE_mapped_and_unmapped.sam > SAMPLE_mapped_and_unmapped.bam

#Filter unmapped reads
samtools view -b -f 12 -F 256 SAMPLE_mapped_and_unmapped.bam > SAMPLE_bothEndsUnmapped.bam

#Split pair-end reads into separated fastq files...
 samtools sort -n SAMPLE_bothEndsUnmapped.bam SAMPLE_bothEndsUnmapped_sorted 
 bedtools bamtofastq -i SAMPLE_bothEndsUnmapped_sorted.bam -fq SAMPLE_r1.fastq -fq2 SAMPLE_r2.fastq