#!/bin/bash

ls

read -p "Continue (y/n)?" choice
case "$choice" in
  y|Y ) echo "yes"
    echo -e "\033[0;32mPublishing updates to GitHub...\033[0m"

    git add .   # Stage all files to commit

    msg="Rebuilding site `date`"   # Commit changes to GitHub pages
    if [ $# -eq 1 ]
      then msg="$1"
    fi
    git commit -m "$msg"

    git push origin master   # Push source and build repos.
    ;;
  n|N ) echo "no"
    echo -e "Review your input."
    ;;
  * ) echo "invalid"
    echo -e "WTF??!"
    ;;
esac
