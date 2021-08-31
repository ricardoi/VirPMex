# Remove Host Sequence from Viromes

# Tutorial http://www.metagenomics.wiki/tools/samtools/remove-host-sequences

# Map Illumina reads againt host genome sequence
# with bowtie2 https://www.nature.com/articles/nmeth.1923
module load bowtie2 samtools bedtools

# Index your Host file 
bowtie2-build genome.fna Host # takes about several minutes

# Mapping reads to the Host genome 
bowtie2 -x Host -1 Reads_1.fastq -2 Reads_2.fastq -S host_mapped_and_unmapped.sam
samtools view -bS host_mapped-unmapped.sam > host_mapped-unmapped.bam

# Filter unmapped reads
samtools view -b -f 12 -F 256 host_mapped-unmapped.sam > host_bothpairs_unmapped.bam

# Split pair-end reads into separated fastq files...
samtools sort -n host_both-pairs_unmapped.bam -o host_bothEndsUnmapped_sorted.bam 
bedtools bamtofastq -i host_both-pairs_unmapped_sorted.bam -fq host_filtered.r1.fastq -fq2 host_filtered.r2.fastq
