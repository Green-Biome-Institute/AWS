#!/bin/bash

# This script is meant to run a series (or a single) bash command
# and then to stop or terminate the instance you are running.
# In order to do this, please:

# 1. Make sure this ec2 instance aws cli is configured
# (use `aws configure` and then fill out the information prompted

# 2. Find the EC2 instance ID (you can find this from the EC2 dashboard
# or by entering `ec2metadata --instance-id` into your command prompt)
# and write it in below next to `EC2ID`:

EC2ID="i-02068a26cacf294fd"

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
LOGDIR="logs_[PLANTNAME]_GETORGANELLE_"$(date +%d%m%Y)

# 4. Enter the commands you want to run between the two lines below:

# code start
echo "Starting your code"
if [ ! -d $LOGDIR ]; then mkdir $LOGDIR; fi
echo $(date) >> $LOGDIR/timestamps.txt
#####################################################################

# here we navigate into each plants subdirectory where we have already placed scripts that have
# specific get-organelle commands within them for each respective plant  

cd APYCNOS
./pt_assem_APYCNOS.sh
cd ..
cd BOREGA
./pt_assem_BOREGA.sh
cd ..
cd GBUXI
./pt_assem_GBUXI.sh
cd ..
cd SESTERO
./pt_assem_SESTERO.sh
cd ..
cd FPURS
./pt_assem_FPURS.sh
cd ..



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
