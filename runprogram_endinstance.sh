#!/bin/bash

# This script is meant to run a series (or a single) bash command
# and then to stop or terminate the instance you are running.
# In order to do this, please:

# 1. Make sure this ec2 instance aws cli is configured
# (use `aws configure` and then fill out the information prompted

# 2. Find the EC2 instance ID (you can find this from the EC2 dashboard
# or by entering `ec2metadata --instance-id` into your command prompt)
# and write it in below next to `EC2ID`:

EC2ID="i-00974d2cc6d562b14"

#ex. EC2ID="i-00974d2cc6d562b14"

# 3. If you want to terminate the EC2 instance after your command,
# make `EC2STATE` below equal to 0, if you want it to just stop, 
# make it equal to 1.

EC2STATE=1

#ex for terminate:
#EC2STATE=0
#ex for stop:
#EC2STATE=1

# 4. Enter the commands you want to run between the two lines below:

# code start
echo "Starting your code"
if [ ! -d "logs" ]; then mkdir logs; fi
echo $(date) > logs/startanalysis.txt
#####################################################################


#fastqc -t 16 GBI_Eovalifolium_S2_L001_R1_001.fastq.gz GBI_Eovalifolium_S2_L001_R2_001.fastq.gz
abyss-pe name=eovalifolium-k31-012122 j=64 v=-v k=31 in="GBI_Eovalifolium_S2_L001_R1_001.fastq.gz GBI_Eovalifolium_S2_L001_R2_001.fastq.gz" | tee eovalifolium-k31-012122-stdout.log



#####################################################################
echo $(date) > logs/endanalysis.txt
echo "Finished with your code"
# code end

# These lines line terminates or stops the EC2 instance.
if [ $EC2STATE = 0 ]; then
	echo "EC2 instance terminating"
	aws ec2 terminate-instances --instance-ids $EC2ID
elif [ $EC2STATE = 1 ]; then
	echo "EC2 instance stopping"
	aws ec2 stop-instances --instance-ids $EC2ID	
fi
