#!/bin/bash
#1.1
mkdir -p dir
#1.2
cd dir
#1.3
mkdir -p d1/d1.1/
touch d1/t1.txt
mkdir -p d2/d2.1/
touch d2/d2.1/f1.csv
mkdir -p d3/d3.1/
mkdir -p d3/d3.2/
touch d3/d3.2/f2.csv
mkdir Aa Bb Cc
#1.4
mv d1/t1.txt d1/d1.1/
#1.5
mv d2/d2.1/f1.csv d1/
#1.6
mv Aa Aa1
#1.7
ls -d *1 *2
#1.8
du --max-depth=1

