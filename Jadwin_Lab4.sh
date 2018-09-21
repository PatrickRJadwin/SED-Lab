#!/bin/bash

OUT="index.html"

if [ "$#" -ne 1 ]
then
    echo "Invalid argument: Missing input_file"
    echo "./Jadwin_Lab4.sh input_file"
    exit 1
fi

# Line 1 header
sed '1 i\<HTML><BODY><TABLE border=1px>' $1 > $OUT

# Line 2 column categories
sed -i '2 s/,/<\/TD><TD>/g; 2 s/^/<TR><TD>/g; 2 s/$/<\/TD><\/TR>/g' $OUT 

# Line 3+ entries

sed -i '3,$ s/","/<\/TD><TD>/g; 3,$ s/"//g; 3,$ s/^/<TR><TD>/g; 3,$ s/$/<\/TD><\/TR>/g' $OUT 

sed -i.bak '/TN/ s/<TR>/<TR bgcolor=#FF0000>/' $OUT

# Last line
sed -i '$ s/$/\n<\/TABLE><\/BODY><\/HTML>/' $OUT 

