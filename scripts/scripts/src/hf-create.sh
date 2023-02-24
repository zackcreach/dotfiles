#!/bin/bash

# Purpose:
# Generate new views-components folder with the same files within it
# You can optionally specify either "webstorm" or "vscode" at the end to open the new files after creation

# Install:
# Locate this file somewhere easy to remember, such as your home folder (~)
# Set file as executable using "chmod +x [PATH_TO_SCRIPT]/hf-create.sh"

# Usage:
# [PATH_TO_SCRIPT]/hf-create.sh [COMPONENT_NAME] [PROGRAM_TO_OPEN_WITH]

# Example:
# ~/hf-create.sh AmazingComponent webstorm

NAME=$1
OPEN_IN=$2
FOLDER='views-components'

create_folder_files() {
  echo "→ Creating $NAME folder"
  mkdir $NAME

  echo "→ Moving into $NAME folder"
  cd $NAME

  echo "→ Creating $NAME files"
  touch "$NAME.js" "$NAME.scss" "index.js"

  case $OPEN_IN in
    webstorm)
      echo "→ Opening files in Webstorm"
      webstorm *
      ;;
    code)
      echo "→ Opening files in VSCode"
      code -r *
      ;;
  esac
}

if [[ "$PWD" =~ $FOLDER$ ]]; then
  create_folder_files
else
  cd $FOLDER
  
  if [[ $? == 0 ]]; then
    echo "→ Moved into ./$FOLDER folder"
    create_folder_files
  fi
fi
