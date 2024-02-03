#!/bin/bash
#1
file $1
#2
wc -l $1
#3
wc -m $1
#4
du -h $1
#5
grep $2 $1 | wc -l
#6
grep -v $2 $1 | wc -l
#7
cat $1 | head -n 5 | tail -n 1
