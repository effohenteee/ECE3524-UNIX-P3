#!/bin/bash
# Fonte Clanton
# ECE 3524 - Intro to UNIX for ECE
# Project 1

NUM_ARGS=2
CUR_LEVEL=0
TEXT_FILE=P1_CLANTON_FONTE.txt


# Since we may need to make repeated calls, let's make it a function so we can call it recursively
traverse_files() {
	is_duplicate=false
	for file in $(find $1 -maxdepth 1 -readable)
	do
		
		# echo $1$file
		# We need to check if the file we are looking at is a directory or another filetype
		if [ -d "$file" ] && [ "$is_duplicate" = false ]; then
			echo -e "${file//[_]/\\_}\n<UL>\n" >>"$TEXT_FILE"

			# Ensure we only print this directory once. This is needed because the output
			# of $(find $1 -maxdepth 1) includes the current directory and we don't want
			# to print it twice
			is_duplicate=true

		elif [ -d "$file" ]; then
			
			# Recursively call traverse_files on the directory
			traverse_files "$file"
		
		else
			
			link_text=$(basename "$file")
			link_text="${link_text//[_]/\\_}"
	  		echo -e "<a href=\"file://"$file"\">"$link_text"</a>\n" >>"$TEXT_FILE"
	  	
	  	fi
	
	done
	echo -e "</UL>\n" >>"$TEXT_FILE"
}

main() {

	# Check for correct number of arguments
	if [ "$#" -ne "$NUM_ARGS"  ]; then
		echo "Incorrect number of arguments!"
		exit
	fi

	# Check if the directory exists
	if [ ! -d "$1" ]; then
		echo "Invalid input \"$1\" : Directory not found or is not a directory type!"
		exit
	fi

	# Create the text file if it doesn't exist, or empty the file if it does exist
	>"$TEXT_FILE"

	# Traverse the folder structure and create the intermediate text file
	traverse_files $1

	# Convert the text file to html
	markdown "$TEXT_FILE" >"$2"
}

# Pass all arguments from the command line to the script. This ensures
# we correctly count the number of arguments.
main $@
