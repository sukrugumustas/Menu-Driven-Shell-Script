#!/bin/bash
# myprog1.sh

# If the user has given no argument, then the user will be prompted.
# "$#" command gives us the argument number, "-eq" command checks equality.
if [[ $# -eq 0 ]]; then
  echo "You didn't enter any arguments!";
# If the argument is equal to 1, program will start.
elif [[ "$#" -eq 1 && -f "$1" ]]; then
  # While there is something on the line, this loop will work.
  while read -r line; do
    # When the script takes the number from that line, it will use that in the
    # "for" loop to display that much stars on the screen.
    for (( i = 0; i<line; i++ )); do
      printf "*";
    done
    # Here, the script is done with that line, so it has to print another line
    # to console for making sense.
    printf "\\n";
    # While loop will work until the end of file that user gave as an argument.
  done < "$1"
# Otherwise, if the file provided by user doesn't exist or is not accessible
# then user will be prompt.
elif ! [[ -f "$1" ]] && [[ "$#" -eq 1 ]]; then
  echo "There is no such file or you don't have the autorithy to access!";
# If the user provides more than one argument, program prompts the user.
else
  echo "You entered more than one argument!"
fi
# Here we are executing mymenu.sh again with the firs path this script is called, because
# when this script ends, it also ends the parent (mymenu.sh), to prevent that we call mymenu.sh
#   again.
exec ./mymenu.sh;