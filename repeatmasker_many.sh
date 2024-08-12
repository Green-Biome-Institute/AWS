#!/bin/bash

# Define variables
plant_names=("CAMBI" "EJEPS" "CFRAN" "GSPEC" "CPUNS" "MAUSS")
base_path="/home/ubuntu/ANNOTATIONS"
j=16
date="081124"

# Setup logfile
current_path=$(pwd)
logfile="$current_path/repeatmasker_status_log"
echo "Logfile initiated at $current_path" >> "$logfile"

# Loop through each plant
for plant_name in "${plant_names[@]}"; do
    plant_path="${base_path}/${plant_name}"
    echo "Processing plant $plant_name in $plant_path" >> "$logfile"

    cd "$plant_path/ANN/"
    input_scaffold=$(ls *fa)    

    RepeatMasker --species arabidopsis -pa $j $input_scaffold

done

echo "Script completed" >> "$logfile"
