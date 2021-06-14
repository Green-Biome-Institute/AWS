# The following commands entered into terminal cycle through folders of genome assemblies from SOAPdenovo2, ABySS, SparseAssembler, and ALLPATHS-LG
# Each loop has to be run independently, not all together 

# SOAP result file with the final assembly is '.scafSeq' 
# '*.filetype' represents 'all files with this filetype'. This works because there is only one file in this folder with the filetype '.scafSeq'.

for k in `seq 15 5 95`; do
cd k$k
/home/ubuntu/.local/bin/busco -i *.scafSeq -l embryophyta_odb10 -o busco-k$k -m genome
python3 /home/ubuntu/quast/quast.py -o quast-k$k -e -k --k-mer-size $k *.scafSeq
cd ..
done

# Single busco and quast entries to test before loop
# /home/ubuntu/.local/bin/busco -i a-thal-out-k15.scafSeq -l embryophyta_odb10 -o busco-k15 -m genome
# python3 /home/ubuntu/quast/quast.py -o quast-k15 -e -k --k-mer-size 15 a-thal-out-k15.scafSeq


