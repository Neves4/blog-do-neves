#!/bin/bash

read -p "Are you sure? Remember to use ./publish-site.sh "\""commit message"\""" -n 1 -r
echo    # move to a new line

if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo -e "\033[0;32mPublishing updates to GitHub...\033[0m"
  hugo # Build the site with current files/configs

  cd public   # Change directory to the 'public' build
  git add .   # Stage all files to commit

  msg="Rebuilding site `date`"   # Commit changes to GitHub pages
  if [ $# -eq 1 ]
    then msg="$1"
  fi
  git commit -m "$msg"

  git push origin master   # Push source and build repos.

  cd ..   # Come Back up to the Project Root
fi
