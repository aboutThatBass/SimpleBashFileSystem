#!/bin/bash

read -p "Enter a course department code and number: " dept num

dept=${dept^^}

filename="data/${dept}${num}.crs"

if [ ! -f "$filename" ]; then
    echo "ERROR: course not found"
    exit 1
fi

currLine=0

while read -r line; do
    if [ $currLine -eq 1 ]; then
        c_name="$line"
        break
    fi
    let currLine=currLine+1
done < "$filename"

rm "$filename"

echo "$(date) DELETED: $dept $num $c_name" >> data/queries.log

echo "$dept $num was successfully deleted."
