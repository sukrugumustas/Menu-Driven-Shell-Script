#!/bin/bash
# myprog5.sh

# If the user has given no argument, then the user will be prompted.
# "$#" command gives us the argument number, "-eq" command checks equality.
if [[ "$#" -eq 0 ]]; then
	echo "You didn't provide any argument(s)!";
# If the argument is equal to 1 and is an integer, program will start.
elif [[ "$#" -eq 1 && $1 -gt 0 ]] && ! [[ ${#1} -eq 1 ]]; then
	#	This rev is for reversing the number.
	rev=0;
	number=$1;
	#	We are reversing number.
	while [[ $number -gt 0 ]]; do
		rev=$((number % 10 + rev * 10));
		number=$((number / 10));
	done
	#	We are summing two-digit integers with special ${source, startingIndex, length} command.
	for (( i = 0; i < $((${#rev} - 1)); i++ )); do
		number=$((number + ${rev:i:2}));
	done
	#	echoing number.
	echo "Sum is $number.";
elif [[ "$#" -eq 1 && $1 -gt 0 && ${#1} -eq 1 ]]; then
	echo "Sum is $1";
# If the argument is equal to 1 and is less than or equal to zero or is not an integer, program won't start.
elif [[ "$#" -eq 1 ]] && [[ ! $1 -gt 0 ]]; then
	echo "The number you provided is neither positive nor a number!";
# If the user provides more than one argument, program prompts the user.
else
	echo "You entered more than one arguments!";
fi
#	Here we are executing mymenu.sh again with the firs path this script is called, because
#	when this script ends, it also ends the parent (mymenu.sh), to prevent that we call mymenu.sh
# 	again.
exec ./mymenu.sh;