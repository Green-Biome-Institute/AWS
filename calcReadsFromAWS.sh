#!/bin/bash

# This script will cycle through a series of AWS buckets with the following structure:
# - mainBucket
#   - plant1
#     - file1
#     - file2
# ...
#   - plantN
#     - file1
#     - file2
# and calculate/record:
# - the total size of all the files for each plant
# - the total number of reads for each plant
# The output will be a directory containing the output CSV and a subdirectory "all"
# with the log files for each of the respective plants
#
# Then, given the estimated genome length and the sequencing read length, 
# you can find the theoretical sequencing depth for each of these plants.
#

# create log directory and a directory within it to store the
# log files and results for all the plants
LOGDIR=seq_depth_info_$(date +%F)
if [ ! -d $LOGDIR ]; then mkdir $LOGDIR; fi
if [ ! -d $LOGDIR/all ]; then mkdir $LOGDIR/all; fi
# create CSV to store the total number of reads per plant 
csvlog=seqdepth_$(date +%F).csv
echo 'Species Name','Number of Reads','Total size of files (in bytes)' >> $csvlog
# variables to store the total number of plants and total number of files analyzed
total=0
plantnum=0

# Start cycling through all plants (manually enter the names of the plants including a "/" at the end of the name)
for plantdir in Abake/ Adensiflora/ Afran/ Aglan/ Aimbr/ Amont/ Amorro/ Apaci/ Apallida/ Apurr/ Apycnos/ Aregi/ Astan/ Atome/ Bfili/ Bmacr/ Bnevi/ Borcu/ Borega/ Bpall/ Bvanes/ Cfoli/ Cgreen/ Cjolo/ Cmollis/ Cpurp/ Crode/ Cstebb/ Dbake/ Dlute/ Ealtis/ Econc/ Egran/ Eovalifolium/ Etrun/ Eulfis/ Fpurs/ Gbuxi/ Gcali/ Hstro/ Lconj/ Lmari/ Lpard/ Mabbottii/ Mfasc/ Minde/ Ninte/ Phick/ Playn/ Qdumo/ Rwood/ Sestero/;
do
        # download bucket of plant with all its data files inside
        aws s3 sync s3://gbi-seq-data/$plantdir ./$plantdir;
        # create a log file for each plant and a variable to hold just the plant name without a forward slash at the end
        logname=$(echo $plantdir | sed 's/[/]//')_log
        plantname=$(echo $plantdir | sed 's/[/]//')
        # record the filesizes both in total bytes and human readable format using ls -l and ls -lh
        echo $logname > $logname
        echo $(date) >> $logname
        echo '-----------------------------' >> $logname
        echo '-----------------------------' >> $logname
        echo 'Compressed filesize:' >> $logname
        ls -l $plantdir >> $logname
        echo '-----------------------------' >> $logname
        echo 'Compressed filesize human readable:' >> $logname
        ls -lh $plantdir >> $logname
        echo '-----------------------------' >> $logname
        echo '-----------------------------' >> $logname

        # Iterate through each file for a given plant using the variable newlines to 
        # store the total new lines added up from all the fastq file because the
        # total number of lines / 4 will be the number of reads in the fastq files
        # as well as the total size of the files added together in bytes
        filesizebuff=0
        newlines=0
        for file in $plantdir*;
        do
                # add size of current file to the total for this plant (using ls and awk)
                filesizebuff=$(ls -l $file | awk '{print $5;}')
                echo $file >> $logname
                echo $(date) >> $logname
                echo 'Newlines words bytes' >> $logname
                # decompress each file and count the number of new lines using gzip and wc
                gzip -dc $file | wc >> $logname
                # add the number of newlines to the total for this plant
                newlines=$newlines+$(tail -n 1 $logname | awk '{print $1;}')
                echo '-----------------------------' >> $logname
                echo '-----------------------------' >> $logname
                # incremenet total number of files analyzed
                total=$(($total+1))
        done
        # Print the total number of reads to that plant's log file
        echo 'Total Number of reads:' >> $logname
        echo $((newlines / 4)) >> $logname
        echo $(date) >> $logname

        # record the total number of reads for this plant to the CSV with all the plants
        echo $plantname,$((newlines / 4)),$filesizebuff >> $csvlog

        # Store the log file in the 'all' subdirectory of the log directory
        mv $logname $LOGDIR/all
        # Remove the data to free up space for the next plant
        rm -r $plantdir
        # increment total number of plants analyzed
        plantnum=$(($plantnum+1))
done
# move CSV result file to the log directory for organization
mv $csvlog $LOGDIR

echo Done processing $total files from $plantnum plants
