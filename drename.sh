#!/bin/bash
if [ -z ${1} ]; then
    echo error.
    exit 1 
fi

find ${1} ! -name README.md > output.temp

while read output
do
    tmp=$(echo ${output##*/} | tr '[:upper:]' '[:lower:]' | sed "s/_/-/g" | sed "s/.*${1##*/}/${1##*/}/g")

    if [ "${output##*/}" != "${tmp##*/}" ]; then
        mv "${1}/${output##*/}" "${1}/${tmp}"
    fi

done < <(cat output.temp)

rm output.temp

mv ${1}/*.pdf ${1}/${1}.pdf
