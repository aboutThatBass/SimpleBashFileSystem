#!/bin/bash

read -p "Enter a course department code: " dept
read -p "Enter a department name: " new_dept_name
read -p "Enter a course number: " num
read -p "Enter a course name: " new_course_name
read -p "Enter the course meeting days (MWF or TH): " new_meeting_days
read -p "Enter the course start date: " new_start_date
read -p "Enter the course end date: " new_end_date
read -p "Enter the course credit hours: " new_hours
read -p "Enter the total enrollment for the course: " new_num_students

dept=${dept^^}
filename="data/${dept}${num}.crs"

if [ ! -f "$filename" ]
then
    echo "ERROR: course not found"
    exit 1
fi

{
    read dept_code dept_name
    read course_name
    read meeting_days course_start course_end
    read hours
    read num_students
} < "$filename"

if [ -n "$new_dept_name" ]
then 
    dept_name="$new_dept_name"
fi

dept_line="${dept} ${dept_name}"

if [ -n "$new_course_name" ]
then
    course_name="$new_course_name"
fi

if [ -n "$new_meeting_days" ]
then
    meeting_days="$new_meeting_days"
fi
if [ -n "$new_start_date" ]
then
    course_start="$new_start_date"
fi
if [ -n "$new_end_date" ]
then
    course_end="$new_end_date"
fi
sched_line="${meeting_days} ${course_start} ${course_end}"

if [ -n "$new_hours" ]
then
    hours="$new_hours"
fi

if [ -n "$new_num_students" ]
then
    num_students="$new_num_students"
fi

echo "$dept_line" > "$filename"
echo "$course_name" >> "$filename"
echo "$sched_line" >> "$filename"
echo "$hours" >> "$filename"
echo "$num_students" >> "$filename"

echo "$(date) UPDATED: ${dept} ${num} ${course_name}" >> data/queries.log
