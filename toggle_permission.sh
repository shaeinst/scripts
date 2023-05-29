#!/bin/bash

# this script is used to recursively toggle the permissions and ownership of files and directories
# for example: if file(s)/directorie(s) has permission and ownership of 766 and username:username then
# by running this script on this file(s)/directorie(s) change the permission and ownership to 000 and root:root
# and re-runnnig the script will change the permission and ownership to 700 and username:username

# Get the path to the file or directory from the first argument
path=$1

# Check if the file or directory exists
if [[ ! -e "$path" ]]; then
  echo "Error: '$path' does not exist."
  exit 1
fi

# Get the current owner of the file or directory
owner=$(stat -c '%U' "$path")

# Toggle the ownership between the current user and root
if [[ "$owner" == "$(whoami)" ]]; then
  sudo chown root:root "$path" -R
  echo "Ownership of '$path' has been set to root."
else
  sudo chown "$(whoami)":"$(whoami)" "$path" -R
  echo "Ownership of '$path' has been set to $(whoami)."
fi

# Get the current permissions of the file or directory
permissions=$(stat -c '%a' "$path")

# Toggle the permissions between 777 and the current user, and 000 and root
if [[ "$permissions" == "000" || "$permissions" == "0" ]]; then
  # sudo chmod 777 "$path" -R
  sudo chmod u+rwx "$path" -R
  echo "Permissions of '$path' have been set to $permissions."
else
  sudo chmod 000 "$path" -R
  echo "Permissions of '$path' have been set to $permissions."
fi
