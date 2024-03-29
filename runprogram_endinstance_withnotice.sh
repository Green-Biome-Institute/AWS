#!/bin/bash

# NOTE: this requires that the AWS account this script is being used in
# has set up an origination number. To do thise go to 
# https://console.aws.amazon.com/pinpoint/home?region=us-east-1#/sms-account-settings/requestLongCode
# and set up a toll-free number that the SMS message can be sent from. 


# This script is meant to run a series (or a single) bash command
# and then to stop or terminate the instance you are running.
# In order to do this, please:

# 1. Make sure this ec2 instance aws cli is configured
# (use `aws configure` and then fill out the information prompted

# 2. Find the EC2 instance ID (you can find this from the EC2 dashboard
# or by entering `ec2metadata --instance-id` into your command prompt)
# and write it in below next to `EC2ID`:

EC2ID="i-00974d2cc6d562b14"

#ex. EC2ID=i-00974d2cc6d562b14

# 3. If you want to terminate the EC2 instance after your command,
# make `EC2STATE` below equal to 0, if you want it to just stop, 
# make it equal to 1.

EC2STATE=1

#ex for terminate:
#EC2STATE=0
#ex for stop:
#EC2STATE=1

# 4. Enter your phone number (full-number including +1 for USA) if 
# you would like a message sent to your phone telling you when the 
# code you submitted below is fone running and when the EC2 instance
# is stopping or terminating. 

PHONE="+16501234567"
 
# 5. Enter the commands you want to run between the two lines below:

# code start
#####################################################################

#ex. run an abyss, soapdenovo, busco, or quast 



#####################################################################
# code end

# This line terminates or stops the EC2 instance
if [ $EC2STATE = 0 ]; then
        echo "EC2 instance terminating"
        aws sns publish --phone-number $PHONE --message 'Your program finished running! The EC2 instance is now terminating.'
        aws ec2 terminate-instances --instance-ids $EC2ID
elif [ $EC2STATE = 1 ]; then
        echo "EC2 instance stopping"
        aws sns publish --phone-number $PHONE --message 'Your program finished running! The EC2 instance is now stopping.'
        aws ec2 stop-instances --instance-ids $EC2ID   
fi

                                                              66,0-1        Bot
