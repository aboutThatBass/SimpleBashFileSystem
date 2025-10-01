#!/bin/bash

read -p "Enter a department code and course number: " dept num

filename="data/${dept}${num}.crs"

if [ ! -f "$filename" ]; then
    echo "ERROR: course not found"
    exit 1
fi

{
    read dept_line
    read c_name
    read schedule c_start c_end
    read hours
    read c_size
} < "$filename"

echo "Course department: $dept_line"
echo "Course number: $num"
echo "Course name: $c_name"
echo "Scheduled days : $schedule"
echo "Course start: $c_start"
echo "Course end: $c_end"
echo "Course hours: $hours"
echo "Enrolled Students: $c_size"
