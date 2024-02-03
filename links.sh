#!/bin/bash
#1
mkdir -p $1
#2
mkdir $1/D1/ $1/D2/ $1/D3/ $1/D4/
touch $1/D2/F1.txt $1/D3/F1.txt $1/D4/F1.txt
#3
ln -s /etc/passwd $1/D1/new_symbolic_link
#4
readlink $1/D1/new_symbolic_link
#5
ln $1/D3/F1.txt $1/D2/F2.txt
#6
chmod 600 $1/D2/F2.txt
#7
chown :users $1/D2/F2.txt
#8
chgrp users $1/D3/
#9
chmod a-x $1/D3/
#10
chmod a-w $1/D2/
#11
chmod a-r $1/D4/
#12
chmod +t $1/D4/
#13
touch $1/D1/scr1.sh
chmod ug+x $1/D1/scr1.sh
#14
chmod ug+s $1/D1/scr1.sh
