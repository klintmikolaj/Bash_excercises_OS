#!/bin/bash
#6.0
#Result of the operation
function f1 {
	if [ $(($1 - $2)) -eq 0 ]; then
		echo "Error, denominator equals 0"
		exit -1
	fi
	echo $(( $(($1 + $2)) / $(($1 - $2)) ))
}

#6.1
#Factorial with recursive method
function f2 {
	if [ $# -ne 1 ]; then
		echo "Error, invalid number of arguments"
		exit -1
	fi
	
	if [ $1 -lt 0 ]; then 
		echo "Error, argument cannot be lesser than 0"
		exit -1
	fi
	
	if [ $1 -eq 0 ]; then
		echo 1
	else
		echo $(( $1 * $( f2 $(( $1 - 1 ))))) 
	fi
}

#6.2
#Factorial with iterative method
function f3 {
	if [ $# -ne 1 ]; then
		echo "Error, invalid number of arguments"
		exit -1
	fi
	
	if [ $1 -lt 0 ]; then 
		echo "Error, argument cannot be lesser than 0"
		exit -1
	fi
	
	result=1
	for ((i=1; i<=$1; i++)); do
		result=$(($result * $i))
	done
	
	echo $result
}

#6.3
#Sum of given numbers
function f4 {
	sum=0
	for i in "$@"
	do
		if [[ $i =~ ^[-+]?[0-9]+$ ]]; then
			sum=$(($sum + $i))
		else 
			echo "Error, invalid value. $i is not an integer!"
			exit -1
		fi
	done
	echo $sum
}

echo ----- TEST -----
echo Result of the operation
f1 $1 $2
echo Factorial with recursive method
f2 $1
echo Factorial with iterative method
f3 $1
echo Sum of given numbers
f4 $@
echo ----- FIN -----
