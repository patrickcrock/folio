# Folio
A collection of code from my Master of Biomedical Science.

## Navigation
This repository is divided into a few sections pertaining to different types of code used over the course of my research:  
### [bash](https://github.com/patrickcrock/folio/tree/main/bash)
This mostly consists of code for jobs submitted to the slurm system on the Melbourne University Spartan HPC. The directory contains the following:
* [Phylogeny pipeline part 1](https://github.com/patrickcrock/folio/blob/main/bash/1_snippy-core1.slurm), which produces a core SNP alignment using Snippy
* [Phylogeny pipeline part 2](https://github.com/patrickcrock/folio/blob/main/bash/2_fasttree1.slurm), which produces a tree of this alignment for reference using FastTree
* [Phylogeny pipeline part 3](https://github.com/patrickcrock/folio/blob/main/bash/3_gubbins.slurm), which uses Gubbins to detect likely recombinant sites in the core alignment
* [Phylogeny pipeline part 4](https://github.com/patrickcrock/folio/blob/main/bash/4_snippy-core2.slurm), which masks recombinant sites detected by gubbins using a .bed file produced from its outputs, using Snippy. 
* [Phylogeny pipeline part 5](https://github.com/patrickcrock/folio/blob/main/bash/5_iqtree.slurm), which produces a phylogeny of the masked core alignment using IQTree2. 
* [CRISPRCasFinder script](https://github.com/patrickcrock/folio/blob/main/bash/crispr-finder.slurm), which uses a Singularity container to use the CRISPRCasFinder program. 
* [MLST script](https://github.com/patrickcrock/folio/blob/main/bash/mlst.slurm) for assignment of multi-locus sequence types to the dataset. 
* [NCBI Data script](https://github.com/patrickcrock/folio/blob/main/bash/ncbiDL) for the download of *Staphylococcus argenteus* genome data.
* [Prokka script](https://github.com/patrickcrock/folio/blob/main/bash/prokka.slurm) for genome annotation.
* [Roary script](https://github.com/patrickcrock/folio/blob/main/bash/roary.slurm) for pangenome analysis of .gff files.
* Snippy scripts for [contig](https://github.com/patrickcrock/folio/blob/main/bash/snippy_ctgs.slurm) and [FastQ](https://github.com/patrickcrock/folio/blob/main/bash/snippy_fqs.slurm) formats.
* [Spades script](https://github.com/patrickcrock/folio/blob/main/bash/spades.slurm) for assembly of short read data into FASTA files.
* A basic [renaming script](https://github.com/patrickcrock/folio/blob/main/bash/rename_csv) to rename files from a .csv reference 

### [R](https://github.com/patrickcrock/folio/tree/main/r)
This directory contains markdown files featuring code used mostly for the construction of figures for my thesis:
* [Piechart-map figures](https://github.com/patrickcrock/folio/blob/main/r/piemap.html)
* [Phylogenies](https://github.com/patrickcrock/folio/blob/main/r/trees.html)
* More specific, in-depth [NT phylogenies](https://github.com/patrickcrock/folio/blob/main/r/NT_trees.html)
* [Bayesian analysis figures](https://github.com/patrickcrock/folio/blob/main/r/emergence.html)
