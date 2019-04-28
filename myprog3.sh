#!/bin/bash
#	myprog3.sh

#	If the user doesn't provide exactly 3 arguments, it will be prompt.
if [[ "$#" -ne 3 ]]; then
	echo "You must enter 3 arguments exactly!";
#	Otherwise, if the file provided by user doesn't exist or is not accessible
#	then user will be prompt.
elif ! [ -f "$1" ]; then
	echo "There is no such file or you don't have the autorithy to access!";
else
#	Else, grep command helps us to find the exact number of occurance of a string
#	in a file. We assigned it to k so we can echo that later.	
	k=$(grep "$2" "$1" -io | wc -l);
#	We arranged grep command for case-nonsensitive for any occurances. If k is equal
#	to zero than that means there is no occurance.
	if [[ "$k" -eq 0 ]]; then
		echo "There is no occurance of \"$2\" in file \"$1\"!";
		exec ./mymenu.sh;
	fi
#	If k is other than zero, sed command helps us to change the found words with other
#	word. We also arrenged it to be case-nonsensitive.
	sed -i "s/$2/$3/Ig" "$1";
	echo "All of $k occurances of \"$2\"s are changed to \"$3\".";
fi
#	Here we are executing mymenu.sh again with the firs path this script is called, because
#	when this script ends, it also ends the parent (mymenu.sh), to prevent that we call mymenu.sh
# 	again.
exec ./mymenu.sh;