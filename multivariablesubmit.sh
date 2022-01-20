#!/bin/bash

################################################################################
# This script is an example of submitting multiple assemblies using SOAPdenovo2
# within one executable file.
# As it is written, it will loop through a series of k-mers, generate a
# directory for the results of each assembly with a name specific to that
# k-mer value, create a timestamp within that directory that will note
# when the assembly starts and stops, and runs a soapdenovo2 assembly (also
# outputting its results into the k-mer labeled directory).
################################################################################

## 1. In this first line we create a for loop that will cycle
# from k=60 to k=70, incrementing by 2. This means the for loop
# will run 6 times using k=60,k=62,k=64,k=66,k=68, and k=70.
for (( K=60; K<=70; K=K+2)); do

    ## 2. Since we are going to be making multiple assemblies in
    # this script, it is a good idea to create some organization
    # for those assemblies instead of having the result files
    # all just end up disorganized in one directory. To do this,
    # we can make a new directory to store the result files in for
    # each k-mer value in this for loop!
    mkdir k$K

    ## 2a. One little trick that we can use to monitor the status of
    # this script is to create a timestamp within this new
    # directory that will add the time when each assembly starts or finishes
    echo "Assembly with k-mer " $K "starting at:" >> k$K/soapassembly-k$K
    date >> k$K/soapassembly-k$K

    ## 3. Now that our organization is set up for the assembly results,
    # we can use the variable k to submit an SOAPdenovo2 assembly with
    # that k-mer value. The SOAPdenovo2 command is:
    SOAPdenovo2-127mer all -s config-file -k $K -R -o currentdir/k$K/assemblyname-output-k$K 1> assemblyk$K.log 2>assemblyk$K.err

    ## 3a. Here we can add any relevant information to the timestamp we created at
    # the beginning (or create a new one, whatever is helpful). This is just
    # a basic example for a way to document other potentially important information
    # relevant to the software you are running. Sometimes people generate these
    # timestamps so that other code can look through your directory to see if
    # certain things are done, in this case an assembly.
    echo "Assembly with k-mer " $K "ending at:" >> k$K/soapassembly-k$K
    date >> k$K/soapassembly-k$K

# now we end the for loop with the "done" statement.
done
