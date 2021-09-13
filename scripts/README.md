# Bioinformatic scripts for the 
## Analysis fo Viromes

##### Author: Ricardo I. Alcala PhD

### List of scripts 
#### High Throughput Sequencing for Viromes
1. Remove sequence adapters from Illumina reads using cutadapt [go to script](https://github.com/ricardoi/VirPMex/blob/main/scripts/cut_adapt.sh)
2. Filtering the host read sequences using the host reference genome using bowtie [go to script](https://github.com/ricardoi/VirPMex/blob/main/scripts/host_genomeseqs-removal.sh)
#### Virome -hybrid- assembly using Sanger and Illumina reads 
3. If you have the .ab1 sequences transform it to fastq using emboss tools [go to script](https://github.com/ricardoi/VirPMex/blob/main/scripts/abi2fastq.sh)
4. Assembly the host-free Illumina reads and the Sanger sequences using Spades [go to script](https://github.com/ricardoi/VirPMex/blob/main/scripts/Spades_metaviralassembler.sh)
5. Pilon or something else to polish the sequence


#### Virome assembly of paired-end Illumina reads
6.Assembly the host-free Illumina reads using Spades [go to script](https://github.com/ricardoi/VirPMex/blob/main/scripts/Spades_metaviralassembler.sh) and modify the Sanger reads part.

Generating consensus sequences 
6. 

# Scripts that will be removed
a. uno repetido
b. dos repetido

This is a schematic representation of how to use this pipeline (Fig 1).
(https://github.com/ricardoi/VirPMex/figures/flow_diagram_viromeassembly.png)
