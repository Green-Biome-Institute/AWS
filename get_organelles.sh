#!/bin/bash

# This script is meant to run a series (or a single) bash command
# and then to stop or terminate the instance you are running.
# In order to do this, please:

# 1. Make sure this ec2 instance aws cli is configured
# (use `aws configure` and then fill out the information prompted

# 2. Find the EC2 instance ID (you can find this from the EC2 dashboard
# or by entering `ec2metadata --instance-id` into your command prompt)
# and write it in below next to `EC2ID`:

EC2ID="i-06e8648c33bf8fa3a"

#ex. EC2ID="i-00974d2cc6d562b14"

# 3. If you want to terminate the EC2 instance after your command,
# make `EC2STATE` below equal to 0, if you want it to just stop, 
# make it equal to 1.

EC2STATE=1

#ex for terminate:
#EC2STATE=0
#ex for stop:
#EC2STATE=1

# what should the name of your logs directory be? This will contain the stop and start information.
LOGDIR="logs_CMOLLIS_GETORGANELLE_"$(date +%d%m%Y)

# 4. Enter the commands you want to run between the two lines below:

# code start
echo "Starting your code"
if [ ! -d $LOGDIR ]; then mkdir $LOGDIR; fi
echo $(date) > $LOGDIR/timestamps.txt
#####################################################################


echo "start chloroplast assembly with embplant_pt seed" > $LOGDIR/timestamps.txt
echo $(date) >> $LOGDIR/timestamps.txt

get_organelle_from_reads.py -1 GBI-2_Cmolli_S78_R1_001_val_1.fq.gz -2 GBI-2_Cmolli_S78_R2_001_val_2.fq.gz  -t 8 -o CMollis_PT_embplantseed -F embplant_pt -R 15 -k 21,45,65,85,105

echo "Finish chloroplast assembly with embplant_pt seed, start mitochondrial assembly with embplant_mt seed" > $LOGDIR/timestamps.txt
echo $(date) >> $LOGDIR/timestamps.txt

get_organelle_from_reads.py -1 GBI-2_Cmolli_S78_R1_001_val_1.fq.gz -2 GBI-2_Cmolli_S78_R2_001_val_2.fq.gz -t 8 -o CMollis_MT_embplantseed -F embplant_mt -R 30 -k 21,45,65,85,105

echo "Finish mitochondrial assembly with embplant_mt seed, start chloroplast assembly with embplant_pt seed + cmollis fasta custom seed" > $LOGDIR/timestamps.txt
echo $(date) >> $LOGDIR/timestamps.txt

get_organelle_from_reads.py -1 GBI-2_Cmolli_S78_R1_001_val_1.fq.gz -2 GBI-2_Cmolli_S78_R2_001_val_2.fq.gz -t 8 -o CMollis_PT_customseed -F embplant_mt -R 15 -k 21,45,65,85,105 -s Clinariifolia_NADH_HQ384819.fasta

echo "Finish chloroplast assembly with embplant_pt seed + cmollis fasta custom seed" > $LOGDIR/timestamps.txt
echo $(date) >> $LOGDIR/timestamps.txt


#####################################################################
echo $(date) >> $LOGDIR/timestamps.txt
echo "Finished with your code"

# code end

# These lines line terminates or stops the EC2 instance.
# You MUST configure this EC2 instance for AWS using 'aws configure' before using this option, otherwise it will NOT work!
if [ $EC2STATE = 0 ]; then
	echo "EC2 instance terminating"
	aws ec2 terminate-instances --instance-ids $EC2ID
elif [ $EC2STATE = 1 ]; then
	echo "EC2 instance stopping"
	aws ec2 stop-instances --instance-ids $EC2ID
fi
