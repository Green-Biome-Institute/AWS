#!/bin/bash

logfile=smudgeplotlog
mkdir tmp
ls *.gz > FILES
cat FILES >> $logfile

/home/ubuntu/KMC/bin/kmc -k21 -t20 -m64 -ci1 -cs10000 @FILES kmcdb tmp | tee -a $logfile
current_datetime=$(date)
current_path=$(pwd)/
echo $current_path >> $logfile
echo "Current date and time: $current_datetime" >> $logfile

/home/ubuntu/KMC/bin/kmc_tools transform kmcdb histogram kmcdb_k21.hist -cx10000 | tee -a $logfile
current_datetime=$(date)
current_path=$(pwd)/
echo $current_path >> $logfile
echo "Current date and time: $current_datetime" >> $logfile

L=$(smudgeplot.py cutoff kmcdb_k21.hist L)
U=$(smudgeplot.py cutoff kmcdb_k21.hist U) 
echo $L $U  | tee -a $logfile
# L should be like 20 - 200
# U should be like 500 - 3000

# Check and adjust L
if ((L > 150)); then
	L=150
elif ((L < 20)); then
	L=20
fi

# Check and adjust U
if ((U > 2750)); then
	U=2750
elif ((U < 500)); then
	U=500
fi
echo $L $U | tee -a $logfile

echo $L > Lval.txt
echo $U > Uval.txt

L=$(cat Lval.txt)
U=$(cat Uval.txt)

echo $L $U  | tee -a $logfile

current_datetime=$(date)
current_path=$(pwd)/
echo $current_path >> $logfile
echo "Current date and time: $current_datetime" >> $logfile

/home/ubuntu/KMC/bin/kmc_tools transform kmcdb -ci"$L" -cx"$U" reduce kmcdb_L"$L"_U"$U" | tee -a $logfile
current_datetime=$(date)
current_path=$(pwd)/
echo $current_path >> $logfile
echo "Current date and time: $current_datetime" >> $logfile
