#!/bin/bash

# Define variables
plant_names=("CAMBI" "EJEPS" "CFRAN" "GSPEC" "CPUNS" "MAUSS")
base_path="/home/ubuntu/ANNOTATIONS"
j=32
date="060424"
k_values=(101 111 121)

# Setup logfile
current_path=$(pwd)
logfile="$current_path/busco_status_log"
echo "Logfile initiated at $current_path" >> "$logfile"

# Loop through each plant
for plant_name in "${plant_names[@]}"; do
    plant_path="${base_path}/${plant_name}"
    echo "Processing plant $plant_name in $plant_path" >> "$logfile"

    # Make sure directory for each k exists
    for k in "${k_values[@]}"; do
        mkdir -p "$plant_path/K$k"
    done

    # Processing for each k value
    for k in "${k_values[@]}"; do
        cd "$plant_path/K$k"
        echo "Processing K$k for $plant_name" >> "$logfile"

        # Collect fastq.gz files and prepare input
        readarray -t fq_files < <(find "${plant_path}/data" -name '*.fq.gz')
        input_files=$(printf "%s " "${fq_files[@]}")
        input_files="${input_files% }"  # Trim the trailing space

        # Run abyss-pe with the collected files
        if [ ! -z "$input_files" ]; then
            abyss-pe name="$plant_name-k$k-abyss-$date-B110G-r5x4l-t$j" j=$j v=-v B=110G k=$k in="$input_files" | tee -a "$plant_name-k$k-abyss-$date-B110G-r5x4l-t$j.log"
            
            # Check for scaffold files
            scaffold=$(ls *-scaffolds.fa)
            if [ -f "$scaffold" ]; then
                busco -i "$scaffold" -l eukaryota_odb10 -o "${scaffold}-busco-eukaryota" -c $j -m genome | tee -a "$logfile"
                busco -i "$scaffold" -l viridiplantae_odb10 -o "${scaffold}-busco-viridiplantae" -c $j -m genome | tee -a "$logfile"
            else
                echo "Scaffold file not found for $plant_name at K$k" >> "$logfile"
            fi
        else
            echo "No input files found for $plant_name at K$k" >> "$logfile"
        fi
    done
done

echo "Script completed" >> "$logfile"
