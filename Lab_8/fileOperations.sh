#!/bin/bash

#1

split_randomly() {

	source="$1"
	file1="$2"
	file2="$3"
	
	if ! [ -r "$source" ]; then
		echo "No permissions to read the file" >&2
		exit -1
	fi
	
	handle_file "$file1"
	handle_file "$file2"
	
	while IFS= read -r line
	do
		if [ $(($RANDOM % 2)) -eq 0 ]; then
			echo "$line" >> "$file1"
		else
			echo "$line" >> "$file2"
		fi
	done < "$source"
		
	 
	
}

handle_file() {
	
	file="$1"
	
	if ! [ -e "$file" ]; then
		touch "$file"
		if ! [ $? -eq 0 ]; then
			echo "Error occured during creating a file"
			exit -1
		fi
		echo "File succesfuly created"
	else
		if ! [ -w "$file" ]; then
			echo "No permissions to write to a file" >&2
			exit -1
		fi
		> "$file"
	fi	
					
}

#split_randomly $1 $2 $3

dir_struct() {
	
	path="$1"
	dir_list="$2"
	
	if ! [ -d "$path" ]; then
		echo "Given path doesn't point to a directory" >&2
		exit -1
	elif ! [ -w "$path" ]; then
		echo "No permissions to write to a file" >&2
		exit -1	
	fi
	
	if ! [ -r "$dir_list" ]; then
		echo "No permissions to read the file" >&2
		exit -1
	fi
	
	while IFS= read -r line
	do
		mkdir "$path/$line"
	done < "$dir_list"
}

#dir_struct $1 $2	










