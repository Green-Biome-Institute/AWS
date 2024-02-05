#!/bin/bash

SCAFFOLD=$(ls *.fa)
echo $SCAFFOLD
MASKED=$(ls *.fa.masked)
echo $MASKED

N_SCAFFOLD=$(tr -cd 'N' < $SCAFFOLD | wc -m)
N_MASKED=$(tr -cd 'N' < $MASKED | wc -m)

echo $N_SCAFFOLD
echo $N_MASKED
echo "$(($N_MASKED-$N_SCAFFOLD))"
