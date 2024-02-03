#!/bin/bash

#1

words_stats(){
	
	input=$1
	output=$2
	
	
	if ! [[ -e "$input" || -r "$input" ]]; then
		echo "Input file doesn't exist or cannot be read!"
		exit -1
	fi

	if [ -e "$output" ]; then
		if ! [ -w "$output" ]; then
			echo "No permissions to write to output file!"
			exit -1
		fi
	else
		touch "$output"
		if ! [ $? -eq 0 ]; then
			echo "Error during creating a file!"
			exit -1
		fi
	fi

	declare -A words_stats

	while IFS= read -r line; do
		read -ra words <<< "$( echo "$line" | tr -s '[:blank:]' | tr -d '[:punct:]' | tr '[:upper:]' '[:lower:]' )"
		for word in ${words[@]}
		do
			(( words_stats[$word]++ ))
		done
	done < "$input"

	echo "WORDS/NUMBER" > "$output"

	for word in ${!words_stats[@]}; do
		echo "$word ${words_stats[$word]}"
	done | sort -k2,2 -nr -k1,1 >> "$output"

}

words_stats $1 $2
