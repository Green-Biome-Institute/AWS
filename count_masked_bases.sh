#!/bin/bash

SCAFFOLD=$(ls *fa)
MASKED=$(ls *fa.masked)

M=$(tr -cd "N" < abake-k128-081722-scaffolds.fa.masked | wc -c)
S=$(tr -cd "N" < abake-k128-081722-scaffolds.fa | wc -c)

echo $M $S
T="$(($M-$S))"
echo $T
