#!/bin/bash

# Create the schemes directory if it doesn't exist
mkdir -p schemes

# Read the repository information from the file and clone each repository
curl -sL https://raw.githubusercontent.com/chriskempson/base16-templates-source/master/list.yaml |
awk '!/^[[:space:]]*(#|$)/ { 
  name=$1; 
  sub(/^[^ ]+ /, ""); 
  url=$0; 
  system("git clone " url " schemes/" name); 
  print "Cloned " name 
}'

