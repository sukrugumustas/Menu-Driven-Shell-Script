#!/bin/bash
# myprog2.sh

# This is the path to execute menu again.
path=$PWD;
# If the user has given no argument, shell script will start working on current directory.
# "$#" command gives us the argument number, "-eq" command checks equality.
if [[ "$#" -eq 0 ]]; then
  # Then the program will start checking all files/folders in that directory.
  for file in $PWD/*; do
    # It will check the file's/folder's name with unwanted file/folder names/extensions and
    # if an unwanted file/folder comes, it will move to the next one.

    # ${filename,,} syntax copies the lowercase string in filename folder to compare with
    # another string.

    # I declared something like *my*.sh, because I don't want to delete my homework's sh files.
    if [[ "$file" = *.c || "$file" = *.h || "$file" = *my*.sh || "${file,,}" = *makefile ]]; then
      continue;
    # Otherwise, it will list the file/folder names on that directory.
    else
      echo "The list of files: "; echo;
      ls -a; echo;
      # Then it will ask the user one by one to remove files/folders.
      while true; do
        echo -n "Should I remove $(basename "$file") (Y/N)?: ";
        # It will read the user's answer then checks if it is yes or no.
        read -r yn;
        if [[ "${yn,,}" = "yes" || "${yn,,}" = "y" ]]; then
          # If the answer is yes, it will remove the file/folder with subfile/subfolders.
          rm "$file";
          break;
        elif [[ "${yn,,}" = "no" || "${yn,,}" = "n" ]]; then
          # If it is no, it will move to next file/folder.
          break;
        # If the answer is neither yes nor no, it will prompt the user to enter yes or no and
        # will ask the remove process for that file/folder again.
        else
          echo "Plese enter \"Yes/Y\" or \"No/N\"!";
        fi
      done
    fi
  done
# If the user has given a path name, program will check if it exists or is accessible. If yes, it will
# do the same things done in first part on the directory user provided.
elif [[ "$#" -eq 1 && -d "$1" && -x "$1" ]]; then
  for file in $1/*; do
    if [[ "$file" = *.c || "$file" = *.h || "$file" = *my*.sh || "${file,,}" = *makefile ]]; then
      continue;
    else
      echo "The list of files: "; echo;
      ls "$1" -a; echo;
      while true; do
        echo -n "Should I remove $(basename "$file") (Y/N)?: ";
        read -pr "" yn;
        if [[ "${yn,,}" = "yes" || "${yn,,}" = "y" ]]; then
          rm "$file";
          break;
        elif [[ "${yn,,}" = "no" || "${yn,,}" = "n" ]]; then
          break;
        else
          echo "Plese enter \"Yes/Y\" or \"No/N\"!";
        fi
      done
    fi
  done
# If the path user provided is not accessible or doesn't exist, user will be prompt and program will end.
elif ! { [ -d "$1" ] && [ -x "$1" ]; } && [[ "$#" -eq 1 ]]; then
  echo "There is no such directory or you don't have the autorithy to access!";
# If the user gives more than one argument, then it will be prompt and program will end.
else
  echo "You entered more than one arguments!";
fi
# Here we are executing mymenu.sh again with the firs path this script is called, because
# when this script ends, it also ends the parent (mymenu.sh), to prevent that we call mymenu.sh
#   again.
exec "$path"/mymenu.sh;