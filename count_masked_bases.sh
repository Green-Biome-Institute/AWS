#!/bin/bash

SCAFFOLD=$(ls *fa)
MASKED=$(ls *fa.masked)

M=$(tr -cd "N" < $MASKED | wc -c)
S=$(tr -cd "N" < $SCAFFOLD | wc -c)

echo $SCAFFOLD $S
echo $MASKED $M

T="$(($M-$S))"

echo "Masked bases:"
echo $T
