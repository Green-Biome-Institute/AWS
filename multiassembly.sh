#!/bin/bash

# This script is meant to run a series (or a single) bash command
# and then to stop or terminate the instance you are running.
# In order to do this, please:

# 1. Make sure this ec2 instance aws cli is configured
# (use `aws configure` and then fill out the information prompted

# 2. Find the EC2 instance ID (you can find this from the EC2 dashboard
# or by entering `ec2metadata --instance-id` into your command prompt)
# and write it in below next to `EC2ID`:

EC2ID="i-0a90182c8ba74df1a"

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
LOGDIR="logs_FP_k121_125_128"

# 4. Enter the commands you want to run between the two lines below:

# code start
echo "Starting your code"
if [ ! -d $LOGDIR ]; then mkdir $LOGDIR; fi
echo $(date) > $LOGDIR/startanalysis.txt
#####################################################################

#ABYSS ASSEMBLY

# K = 121
#echo 'k121_start' >> $LOGDIR/startanalysis.txt
#echo $(date -u) >> $LOGDIR/startanalysis.txt
#abyss-pe name=fpurshiana-k121-062222 j=64 v=-v k=121 in="GBI47-Fpurs_R1_trimmed.fq.gz GBI47-Fpurs_R2_trimmed.fq.gz GBI47-Fpurs_S102_L001_R1_001_val_1.fq.gz GBI47-Fpurs_S102_L001_R2_001_val_2.fq.gz" | tee fpurshiana-k121-062222-stdout.log
#echo 'k121_end' >> $LOGDIR/startanalysis.txt
#echo $(date -u) >> $LOGDIR/startanalysis.txt

# K = 125
echo 'k125_start' >> $LOGDIR/startanalysis.txt
echo $(date -u) >> $LOGDIR/startanalysis.txt
abyss-pe name=fpurshiana-k125-062222 j=64 v=-v k=125 in="GBI47-Fpurs_R1_trimmed.fq.gz GBI47-Fpurs_R2_trimmed.fq.gz GBI47-Fpurs_S102_L001_R1_001_val_1.fq.gz GBI47-Fpurs_S102_L001_R2_001_val_2.fq.gz" | tee fpurshiana-k125-062222-stdout.log
mv coverage.hist FP_K125
echo 'k125_end' >> $LOGDIR/startanalysis.txt
echo $(date -u) >> $LOGDIR/startanalysis.txt

# K = 128
echo 'k128_start' >> $LOGDIR/startanalysis.txt
echo $(date -u) >> $LOGDIR/startanalysis.txt
abyss-pe name=fpurshiana-k128-062222 j=64 v=-v k=128 in="GBI47-Fpurs_R1_trimmed.fq.gz GBI47-Fpurs_R2_trimmed.fq.gz GBI47-Fpurs_S102_L001_R1_001_val_1.fq.gz GBI47-Fpurs_S102_L001_R2_001_val_2.fq.gz" | tee fpurshiana-k128-062222-stdout.log
mv coverage.hist FP_K128
echo 'k128_end' >> $LOGDIR/startanalysis.txt
echo $(date -u) >> $LOGDIR/startanalysis.txt

#quast.py -o sestero-quast-k63-031222 -e -k --k-mer-size 63 sestero-k63-030722-scaffolds.fa
#busco -i sestero-k63-030722-scaffolds.fa -l viridiplantae_odb10 -o sestero-k63-030722 -c 32 -m genome


#####################################################################
echo $(date) > $LOGDIR/endanalysis.txt
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
