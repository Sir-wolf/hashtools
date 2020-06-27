#!/bin/bash
# A menu driven shell script sample template 
## ----------------------------------
# Step #1: Define variables
# ----------------------------------
EDITOR=vim
PASSWD=/etc/passwd
RED='\033[0;41;30m'
STD='\033[0;0;39m'
 
# ----------------------------------
# Step #2: User defined function
# ----------------------------------
pause(){
  read -p "Press [Enter] key to continue..." fackEnterKey
}

one(){
	echo "Install.."
	chmod +x install.sh
	./install.sh
        pause
}
 
two(){
	echo "~~~~~~~~~~~~~~~~~~~~~"
	cat logo_unhash.txt
	echo "~~~~~~~~~~~~~~~~~~~~~"
	./unhash.py
        pause
}

three(){
	echo "~~~~~~~~~~~~~~~~~~~~~"
	cat logo_hash.txt
	echo "~~~~~~~~~~~~~~~~~~~~~"
	./hashtools.py
        pause
}
# function to display menus
show_menus() {
	clear
	echo "~~~~~~~~~~~~~~~~~~~~~"	
	cat hashtools_menu.txt
	echo "~~~~~~~~~~~~~~~~~~~~~"
    echo "    "
	echo "1. Install"
    echo "2. unHash"
    echo "3. Hash"
	echo "4. Exit"
}
# read input from the keyboard and take a action
# invoke the one() when the user select 1 from the menu option.
# invoke the two() when the user select 2 from the menu option.
# Exit when user the user select 3 form the menu option.
read_options(){
	local choice
	read -p "Enter choice [ 1 - 4] : " choice
	case $choice in
		1) one ;;
		2) two ;;
        3) three ;;
		4) exit 0;;
		*) echo -e "${RED}Error...${STD}" && sleep 2
	esac
}
 
# ----------------------------------------------
# Step #3: Trap CTRL+C, CTRL+Z and quit singles
# ----------------------------------------------
trap '' SIGINT SIGQUIT SIGTSTP
 
# -----------------------------------
# Step #4: Main logic - infinite loop
# ------------------------------------
while true
do
 
	show_menus
	read_options
done