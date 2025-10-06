#!/bin/bash

read -p "Enter a course department code and number: " dept num

dept=${dept^^}

filename="data/${dept}${num}.crs"

if [ ! -f "$filename" ]; then
    echo "ERROR: course not found"
    exit 1
fi

read -p "Enter an enrollment change amount: " change

currLine=0

while read -r line; do
    case $currLine in
        0) dept_line="$line";;
        1) c_name="$line";;
        2) sched_line="$line";;
        3) hours="$line";;
        4) numStudents="$line";;
    esac
    let currLine=currLine+1
done < "$filename"

let numStudents=numStudents+change

echo "$dept_line" > "$filename"
echo "$c_name" >> "$filename"
echo "$sched_line" >> "$filename"
echo "$hours" >> "$filename"
echo "$numStudents" >> "$filename"

echo "$(date) ENROLLMENT: $dept $num $c_name changed by $change" >> data/queries.log
