#!/bin/bash
# Fonte Clanton
# ECE 3524 - Intro to UNIX for ECE
# Project 3


print_menu() {
	dots="---------------------------"
	currentDate=`date`
	echo ""
	echo "$currentDate"
	echo "$dots"
	echo "Main Menu"
	echo "$dots"
	echo " 1. Operating system info"
	echo " 2. Hostname and DNS info"
	echo " 3. Network info"
	echo " 4. Who is online"
	echo " 5. Last loggin in users"
	echo " 6. My IP address"
	echo " 7. My disk usage"
	echo " 8. My home file-tree"
	echo " 9. Process operations"
	echo "10. Exit"
	echo -n "Enter your choice [ 1 - 10 ] "
}

get_selection() {
	read selection
	if [[ $selection =~ ^[0-9]+$ ]] && [ "$selection" -ge 1 ] && [ "$selection" -le 10 ]; then
		echo "$selection"
	else
		echo 0
	fi
}

main() {
	print_menu
	choice=`get_selection`
	if [ "$choice" -ne 0 ]; then
		:
	else
		echo""
		echo "Invalid choice"
		exit 1
	fi

	if [ "$choice" -eq 1 ]; then
		:
	elif [ "$choice" -eq 2]; then
		:
	elif [ "$choice" -eq 3]; then
		:
	elif [ "$choice" -eq 4]; then
		:
	elif [ "$choice" -eq 5]; then
		:
	elif [ "$choice" -eq 6]; then
		:
	elif [ "$choice" -eq 7]; then
		:
	elif [ "$choice" -eq 8]; then
		:
	elif [ "$choice" -eq 9]; then
		:
	else
		:
	fi

}

main
