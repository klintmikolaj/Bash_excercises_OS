#!/bin/bash
#1
mkdir -p $1
#2
grep "$(whoami)" /etc/passwd
#3
cut -d: -f1,6,7 /etc/passwd | sort -r -t: -k1.1 > $1/F1.csv
#4
cut -d: -f7 /etc/passwd | rev | sort -t: -k1.1 | rev | uniq > $1/F2.csv
#5
cut -d: -f1 /etc/passwd | tr [:lower:] [:upper:] > $1/F3.txt
#6
grep -A 4 -B 4 "$(whoami)" /etc/passwd | grep -v "$(whoami)" > $1/F4.txt
#7
diff -y /etc/passwd $1/F4.txt > $1/differences.txt
