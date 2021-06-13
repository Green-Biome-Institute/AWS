#!/bin/bash

# The following commands entered into terminal or entered as a bash script (./kmer-analysis-soap) cycles through 
# the k-mer values 20 through 100 with steps of 20 and then within that the number of skipped intermediate k-mers (g) using 3, 10, 17, and 24:
# makes a folder in the current directory with the label "k$k-g$g", where $k/$g are the k-mer and skipped intermediate k-mer values
# submits a SparseAssembler assembly with an expected genome length of 130 Mb
# outputs a series of assemblies in their respective folders

for k in `seq 20 20 100`; do
for g in `seq 3 7 24` ; do
mkdir k$k-g$g && cd k$k-g$g
touch start-k$k-g$g
./../SparseAssembler/compiled/SparseAssembler g $g k $k LD 0 GS 130000000 NodeCovTh 1 EdgeCovTh 0 f ../data/SRR1946554_1.fastq f ../data/SRR1946554_2.fastq
touch done-k$k-g$g
cd ..
done
done
