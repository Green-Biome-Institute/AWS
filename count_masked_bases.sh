#!/bin/bash

SCAFFOLD=$(ls *fa)
MASKED=$(ls *fa.masked)

M=$(tr -cd "N" < $MASKED | wc -c)
S=$(tr -cd "N" < $SCAFFOLD | wc -c)

echo $SCAFFOLD 
echo $S
echo
echo $MASKED 
echo $M
echo

T="$(($M-$S))"

echo "Masked bases:"
echo $T
