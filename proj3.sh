#!/bin/bash
# Fonte Clanton
# ECE 3524 - Intro to UNIX for ECE
# Project 3


print_header() {
	echo "------------------------------------"
	echo "  $1"
	echo "------------------------------------"
}

print_menu() {
	currentDate=`date`
	echo ""
	echo "$currentDate"
	print_header "Main Menu"
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

enter_to_continue() {
	read -p "Press [Enter] key to continue..."
}

os_info() {
	echo ""
	print_header "System information"
	info=`/usr/bin/lsb_release -a`
	printf "$info\n"
}

hostname_and_dns_info() {
	hostname=`hostname`
	dns_domain=`hostname -d`
	fqdn=`hostname -f`
	net_addr=`hostname -i`
	dns_server=`cat /etc/resolv.conf | grep nameserver | awk '{print $2}'`

	echo ""
	print_header "Hostname and DNS information"
	echo "Hostname : $hostname"
	echo "DNS domain : $dns_domain"
	echo "Fully qualified domain name : $fqdn"
	echo "Network address (IP) : $net_addr"
	echo "DNS name server(DNS IP) : $dns_server"
}

network_info() {
	echo ""
	print_header "Network information"
	printf "Total network interfaces found : %d\n" "`expr $(netstat -i | wc -l) - 3`"
	echo "*** IP Addresses Information ***"
	echo "`ip addr show`"
	echo "***********************"
	echo "*** Network routing ***"
	echo "***********************"
	echo "`netstat -r`"
	echo "**************************************"
	echo "*** Interface  traffic information ***"
	echo "**************************************"
	echo "`netstat -i`"

}

who_is_online() {
	echo ""
	print_header "Who is online"
	echo "`who -H`"
}

last_logged_in() {
	echo ""
	print_header "List of last logged in users"
	echo "`last`"
}

main() {
	print_menu
	choice=`get_selection`
	if [ "$choice" -ne 0 ]; then
		:
	else
		echo""
		echo "Invalid choice"
	fi

	if [ "$choice" -eq 1 ]; then
		os_info
	elif [ "$choice" -eq 2 ]; then
		hostname_and_dns_info
	elif [ "$choice" -eq 3 ]; then
		network_info
	elif [ "$choice" -eq 4 ]; then
		who_is_online
	elif [ "$choice" -eq 5 ]; then
		last_logged_in
	elif [ "$choice" -eq 6 ]; then
		:
	elif [ "$choice" -eq 7 ]; then
		:
	elif [ "$choice" -eq 8 ]; then
		:
	elif [ "$choice" -eq 9 ]; then
		:
	else
		:
	fi

	enter_to_continue

}

main
