#!/bin/bash

read -p "Department code: " dept
read -p "Department name: " dept_name
read -p "Course number: " c_num
read -p "Course name: " c_name
read -p "Course schedule (MWF or TH): " schedule
read -p "Course start date: " c_start
read -p "Course end date: " c_end
read -p "Credit hours: " hours
read -p "Initial enrollment: " c_size

filename="data/${dept}${c_num}.crs"

if [ -f "$filename" ]; then
    echo "ERROR: course alredy exists"
else
    {
        echo "$dept $dept_name"
        echo "$c_name"
        echo "$schedule $c_start $c_end"
        echo "$hours"
        echo "$c_size"
    } > "$filename"

    echo "$(date) CREATED: $dept $c_num $c_name" >> data/queries.log
fi
