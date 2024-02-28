#!/bin/bash

# Show all available drives/partitions and store them in an associative array
declare -A drive_map
echo "Available drives/partitions:"

counter=0
while read -r line; do
  if [ $counter -gt 0 ]; then
    letter=$(printf "\\$(printf '%03o' "$((97 + counter - 1))")")
    drive=$(echo "$line" | awk '{print $1}')
    echo "$letter. $line"
    drive_map["$letter"]="$drive"
  else
    echo "$line"
  fi
  counter=$((counter + 1))
done < <(df -H)

# Add an empty line
echo ""

# Prompt the user to enter the path of the external drive
echo "Select the drive/partition to be safely removed (unmount and power-off) :"
read letter_choice

drive_path="${drive_map[$letter_choice]}"

# Unmount the drive
udisksctl unmount -b "$drive_path"

# Power off the drive
udisksctl power-off -b "$drive_path"

