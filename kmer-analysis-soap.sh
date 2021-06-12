#!/bin/bash

# The following commands entered into terminal or entered as a bash script (./kmer-analysis-soap) cycles through the k-mer values 15 through 95 with steps of 5 and:
# makes a folder in the current directory with the label "k$k", where $k represents the current k-mer value being used
# submits a SOAPdenovo2 assembly with the current k-mer value being used
# uses the config file "a-thaliana-config" 
#   note this doesn't need to change between implementations because k-mer value is specified in the call to the SOAPdenovo2 assembler
# outputs result files with the prefix "a-thal-out-k$k" as well as 2 files relating to the logs of the assembly run (assemblyk$k.log ; assemblyk$k.err)

for k in `seq 15 5 95`; do
mkdir k$k
soapdenovo2-127mer all -s /home/ubuntu/a-thaliana-kmer-analysis/a-thaliana-config -k $k -R -o /home/ubuntu/a-thaliana-kmer-analysis/k$k/a-thal-out-k$k 1>assemblyk$k.log 2>assemblyk$k.err
done
