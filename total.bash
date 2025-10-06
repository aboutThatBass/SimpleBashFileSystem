#!/bin/bash

count=0

for file in data/*.crs
do
    if [ -f "$file" ]
    then
        let count=count+1
    fi
done

echo "Total course records: $count"
