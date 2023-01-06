#!/bin/bash

# This script is meant to run a series (or a single) bash command
# and then to stop or terminate the instance you are running.
# In order to do this, please:

# 1. Make sure this ec2 instance aws cli is configured
# (use `aws configure` and then fill out the information prompted

# 2. Find the EC2 instance ID (you can find this from the EC2 dashboard
# or by entering `ec2metadata --instance-id` into your command prompt)
# and write it in below next to `EC2ID`:

EC2ID="i-00b4c52f923d384a2"

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

# what should the name of your logs directory be? This will contain the stop and start information.
LOGDIR="logs_aimbr_K133_abyss_t64_m256_"$(date +%d%m%Y)

# code start
echo "Starting your code"
if [ ! -d $LOGDIR ]; then mkdir $LOGDIR; fi
echo $(date) >> $LOGDIR/timestamps.txt

id="_aimbr_k127_abyss_"$(date +%F)
echo true > "flag_"$id.txt

count () {

	# your code here:
	#############################

	# for example, an abyss assembly:
	abyss-pe name=aimbr-k133-010423 j=62 v=-v k=127 in="GBI28-Aimbr_S83_L001_R2_001_trimmed.fq.gz GBI28-Aimbr_S83_L001_R1_001_trimmed.fq.gz GBI28-Aimbr_S154_L002_R2_001_trimmed.fq.gz GBI28-Aimbr_S154_L002_R1_001_trimmed.fq.gz GBI28-Aimbr_R2_trimmed.fq.gz GBI28-Aimbr_R1_trimmed.fq.gz" | tee -a aimbr-k133-stdout.log


	#############################



	echo false > $"flag_"$id.txt
	
}

monitor () {
	monitorfile=monitor$id.csv
	> $monitorfile
	dstfile=dstat$id.csv
	t=true
	dstat -cmt --out dstat$id.csv 1 1 > buff
	cat dstat$id.csv >> $monitorfile
	while [[ "$t" == true ]]; do
		dstat -cmt --out dstat$id.csv 1 1 > buff
	#	cat buff
	#	cat dstat$id.csv
		tail -n 1 dstat$id.csv >> $monitorfile
		sleep 1
		t=$(cat $"flag_"$id.txt)
		if [[ "$t" == false ]]; then
			break
		fi
	done
	rm buff dstat$id.csv "flag_"$id.txt
	}

monitor &
count


echo $(date) >> $LOGDIR/timestamps.txt
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
