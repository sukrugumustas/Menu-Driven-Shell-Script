#!/bin/bash
#	myprog4.sh
#	150114032, Şükrü Gümüştaş
#	150115066, Atakan Ülgen

#	This is the path to execute menu again.
path=$PWD;
# If the user has given no argument, shell script will start working on current directory.
# "$#" command gives us the argument number, "-eq" command checks equality.
if [[ "$#" -eq 0 ]]; then
	#	Below two lines helps us to find largest and smallest content in the directory.
	#	However, $(du -sb * | sort -nr | head -1) command gives us a filename with its size
	#	at the beginning, so I removed that size information to use filename later.
	echo "Files before move: "; echo;
	ls;
	biggestfile="$(echo "$(du -sb * | sort -nr | head -1)" | cut -d ' ' -f 2-)";
	smallestfile=$(echo "$(du -sb * | sort -n | head -1)" | cut -d ' ' -f 2-);
	#	Creating our directories.
	mkdir -p smallest largest;
	#	Moving files one by one.
	mv "$biggestfile" largest;
	mv "$smallestfile" smallest;
	echo "\"$biggestfile\" is moved to folder \"largest\" and \"$smallestfile\" is moved to folder \"smallest\".";
	echo; echo "Files after move: ";
	ls;
# If the user has given a path name, program will check if it exists or is accessible. If yes, it will
# do the same things done in first part on the directory user provided.
elif [[ "$#" -eq 1 && -d "$1" && -x "$1" ]]; then
	k=0;
	#	It will count the content number.
	for file in $1/*; do
		((k+=1));
	done
	#	If our k variable is equal to zero, that means there is nothing in the folder or path so script
	#	doesn't have to be run.
	if [[ "$k" -eq 0 ]]; then
		echo "There is no file or directory in the folder!";
	else
		#	Otherwise, it will go to change directory to user provided directory.
		cd "$1" || exit;
		#	Then do the same things done in part one.
		echo "Files before move: "; echo;
		ls;
		biggestfile="$(echo "$(du -sb * | sort -nr | head -1)" | cut -d ' ' -f 2-)";
        	smallestfile=$(echo "$(du -sb * | sort -n | head -1)" | cut -d ' ' -f 2-);
		mkdir -p smallest largest;
		mv "$biggestfile" largest;
		mv "$smallestfile" smallest;
		echo "\"$biggestfile\" is moved to folder \"largest\" and \"$smallestfile\" is moved to folder \"smallest\".";
		echo; echo "Files after move: ";
		ls;
	fi
# If the path user provided is not accessible or doesn't exist, user will be prompt and program will end.
elif ! { [ -d "$1" ] && [ -x "$1" ]; } && [[ "$#" -eq 1 ]]; then
  echo "There is no such directory or you don't have the autorithy to access!";
# If the user gives more than one argument, then it will be prompt and program will end.
else
  echo "You entered more than one arguments!";
fi
#	Here we are executing mymenu.sh again with the firs path this script is called, because
#	when this script ends, it also ends the parent (mymenu.sh), to prevent that we call mymenu.sh
# 	again.
exec "$path"/mymenu.sh;