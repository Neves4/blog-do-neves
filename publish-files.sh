#!/bin/bash

echo "Only proceed if all files are ready. Continue? (y/n)"
read -p "" RESP

echo -en "\ec"

if [ "$RESP" = "y" ]; then
  echo
  echo -e "\033[0;32mPublishing updates to GitHub...\033[0m"
  echo

  git add .   # Stage all files to commit

  echo "Type your commit message: (valid string, please)"
  read -p "" string # Ask the user to enter a string

  git commit -m "$string"

  git push origin master   # Push source and build repos.
else
  echo "Finish your modifications before using this script."
fi
