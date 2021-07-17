#!/bin/bash
if [ -z $1 ]; then
    echo "Usage: rename directory"
    exit 1
fi

rm ${1}-001.png

NUM_LIST=$(ls -1 -I *-002.png | grep -Po "(?<=-)[[:digit:]]*")

for num in ${NUM_LIST}
do
    if [ $((10#${num}%2)) -eq 0 ]; then
        nnum=$(printf "%03d" $((10#${num}/2+1)) )
        mv ${1}-${num}.png ${1}-${nnum}.png
    else
        rm ${1}-${num}.png
    fi

done