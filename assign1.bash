#!/bin/bash

while true
do
    echo ""
    echo "Enter one of the following actions or press CTRL-D to exit."
    echo "   C - create a new course record"
    echo "   R - read an existing course record"
    echo "   U - update an existing course record"
    echo "   D - delete an existing course record"
    echo "   E - update enrolled student count of existing course"
    echo "   T - show total course count"

    if ! read -p "-> " input
    then
        echo "Goodbye!"
        exit 0
    fi

    case "$input" in
        [Cc]) ./create.bash;;
        [Rr]) ./read.bash;;
        [Uu]) ./update.bash;;
        [Dd]) ./delete.bash;;
        [Ee]) ./enroll.bash;;
        [Tt]) ./total.bash;;
        *) echo "ERROR: invalid option";;
    esac
done
