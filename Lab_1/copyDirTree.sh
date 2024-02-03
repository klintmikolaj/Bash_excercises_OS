#!/bin/bash
#2.1
mkdir -p $2
#2.2
cp -r $1 $2
#2.3
cd $2
#2.4
ls -l
#2.5
#tree -s
#2.6
pwd
#2.7
cd -
#2.8
rm -r $2
