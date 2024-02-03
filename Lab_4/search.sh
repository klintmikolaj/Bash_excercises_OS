#!/bin/bash
#1
mkdir -p $2
#2
find "$1" -type f -name "*.txt"
#3
find "$1" -type l
#4
find "$1" -type f -perm /a=x -name "*.sh"
#5 
find "$1" -type d -name "[aAdD]*"
#6
find "$1" -type f -empty -user "user"
#7
find "$1" -type f -group "user" -size +1M
#8
find "$1" -type f -mmin 120
#9
find "$1" -type d -perm /a=t
#10
find "$1" -type f -perm /u=s,g=s
#11
find /dev/ \( -type b -o -type c \)
#12
find "$1" -type d -empty -exec rmdir {} \;
#13
find "$1" -type f -size +100M -exec mv {} "$2" \;
#14
find "$1" -type d -name "Z*" -exec cp -r {} "$2" \; 
