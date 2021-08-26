#Simple Mapping Pipeline

#Use cassava_virus.fna genoma to create the index for the reference. This will be the target of the mapping
bowtie2-build cassava_virus.fna cassava_virus.fna

#Map a set of pair end read cassava1.fq and cassava2.fq in your reference 
bowtie2 -x cassava_virus.fna -1 cassava1.fq  -2 cassava2.fq  -S results.sam

#The results are in sam format and have to be compacted in bam format using samtools
samtools view -bS -o results.bam results.sam

#bam file have to be sorted 
samtools sort results.bam results.sorted

#and indexed
samtools index results.sorted.bam

#Now copy and paste results.sorted.bam and results.sorted.bam.bai in your desktop. We are going to use artemis to analyze  the results graphically. In addition you need the file cassava_virus.gb. This is is your reference. Open this file with artemis. and then loaded the results.sorted.bam file. Your reads can visualized now 

## Click in the upper window to mark possible SNPS you will see then in red. too many!!. Many of them are false calls. To detect SNPs Lets use freebayes : a genetic variant detector based on bayesian theory
#the parameter -p indicates if your genome is haploid 1 or diploid 2. the parameter -f takes your reference and then it needs your sorted-mapping results. The result will be stored (>) in a vcf file format

#First try  haploid model
freebayes -p 1 -f cassava_virus.fna results.sorted.bam > possible_SNPs.vcf

#Use less to inspect the vcf file
#less possible_SNPs.vcf

#the vcf file is vey big and has a big header, lets use unix commands to summary the results and see position of most likely SNPs
grep 'gi|' possible_SNPs.vcf | cut -f 1,2,3,4,5,6


#Try the diploid model
freebayes -f cassava_virus.fna results.sorted.bam > possible_SNPs.vcf
grep 'gi|' possible_SNPs.vcf | cut -f 1,2,3,4,5,6
