#!/bin/bash
######################################################
##############################

trap no_ctrlc SIGQUIT SIGTERM SIGTSTP 
process()
{
jq -s -R '[[ split("\n")[] | select(length > 0) | split("  +";"") | {(.[0]): .[1]}] | add]' /tmp/out
> /tmp/out
show_main_menu
}

optionselect()
{
> /tmp/out
if [[  $opt_main = "1" ]];then
        show_start_menu;
         if [[ $opt_number != "0" ]]  && [[  $opt_number =~ ^[0-9]+$ ]];then
			start_no="1"
			value="1"
			for i in `seq $start_no $opt_number`
			do
				echo -e "Input the value $i"
				read number$i
                                val=`echo number$i`
                                echo "InputNumber$i       ${!val}" >> /tmp/out
				value=`echo "${!val}*$value"|bc`

			done	
			echo "Multiplication       $value" >> /tmp/out
			process
		else
			echo "Invalid input exiting........"
			sleep 5
		fi
	

elif  [[  $opt_main = "2" ]];then
        echo "system  randomly picked 10 numbers from 0-10 ranges"
#	ascen=`shuf -i 0-20 -n 10|sort -nr -k1|tr '\n' ' '`
#	decen=`shuf -i 0-20 -n 10|sort -nr -k1|tr '\n' ' '`
#	echo "Random values are sorted in ascending order $ascen" 
#	echo "Random values are sorted in ascending order $decen" 
	python random_generate.py
	show_main_menu
else
	echo "Not valid option switching to main menu"
	show_main_menu

fi

}

show_main_menu(){
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${MENU}**${NUMBER} 1)${MENU} Number of arguments ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 2)${MENU} Pick Random number ${NORMAL}"
    echo -e "${ENTER_LINE}Please enter a menu option and enter or ${RED_TEXT}enter to exit. ${NORMAL}"
    read opt_main
    optionselect	
}

show_start_menu(){
     echo -e "ENTER the ranges of numbers " 	
     read opt_number
}

show_main_menu
