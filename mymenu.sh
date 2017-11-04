#!/bin/bash
# mymenu.sh
# 150114032, Şükrü Gümüştaş
# 150115066, Atakan Ülgen

#	If user provides an argument, program won't work.
if [[ "$#" -ne 0 ]]; then
	echo "I don't want you to give any arguments!";
	exit 1;
fi
#	Otherwis, it will show the menu to user, user will select one choice.
#	If choice is exit, it will end the process.
#	If choice is not legit, user will be prompted.
for i in $0; do
	chmod +x "$i";
done
while :
do
	echo;
	echo "=============== MENU ================";
	echo "1. Print Asteriks (Stars Per Line)";
	echo "2. Delete Some Files";
	echo "3. Change Words";
	echo "4. Move Largest and Smallest Content";
	echo "5. Make Reverse Two-Digit Addition";
	echo "6. Exit";
	echo "=====================================";
	echo -n "Enter your menu choice [1-6]: "
	#	Reading user's choice and comparing it with cases.
	read -r choice;
	case $choice in
		1) echo;
		echo -n "Please provide a filename: ";
		#	We will get argument(s) from user. If user enters arguments more than one
		#	only first one will be stored in arg1, remaining string will be in arg2.
		#	This process is applied to all other cases, in case of number of inputs more
		#	than wanted.
		read -r arg1 arg2;
		if [[ $arg1 ]] && ! [[ $arg2 ]]; then
			exec ./myprog1.sh "$arg1";
		elif [[ $arg1 && $arg2 ]]; then
			exec ./myprog1.sh "$arg1" "$arg2";
		else
			exec ./myprog1.sh;
		fi
		;;
		2) echo;
		echo -n "You may provide a path or keep it empty: ";
		read -r arg1 arg2;
		if [[ $arg1 ]] && ! [[ $arg2 ]]; then
			exec ./myprog1.sh "$arg1";
		elif [[ $arg1 && $arg2 ]]; then
			exec ./myprog1.sh "$arg1" "$arg2";
		else
			exec ./myprog1.sh;
		fi
		;;
		3) echo;
		echo -n "Please provide a filename and two words to change: ";
		read -r arg1 arg2 arg3 arg4;
		if [[ $arg1 && $arg2 && $arg3 ]] && ! [[ $arg4 ]]; then
			exec ./myprog3.sh "$arg1" "$arg2" "$arg3";
		else
			exec ./myprog3.sh "$arg1" "$arg2" "$arg3" "$arg4";
		fi
		;;
		4) echo;
		echo -n "You may provide a path or keep it empty: ";
		read -r arg1 arg2;
		if [[ $arg1 ]] && ! [[ $arg2 ]]; then
			exec ./myprog4.sh "$arg1";
		elif [[ $arg1 && $arg2 ]]; then
			exec ./myprog4.sh "$arg1" "$arg2";
		else
			exec ./myprog4.sh;
		fi
		;;
		5) echo;
		echo -n "Please enter an integer: ";
		read -r arg1 arg2;
		if [[ $arg1 ]] && ! [[ $arg2 ]]; then
			exec ./myprog5.sh "$arg1";
		elif [[ $arg1 && $arg2 ]]; then
			exec ./myprog5.sh "$arg1" "$arg2";
		else
			exec ./myprog5.sh;
		fi
		;;
		6) echo "Bye Bye!"; echo; exit 1;;
		*) echo;
		echo "Please give an input between 1-6!";;
	esac
done