#!/bin/bash

# Define your contacts
declare -A contacts
contacts[Ekansh]=9326715173
contacts[Yashi]=9368888716
contacts[Abhinav]=7651933940
contacts[Damini]=9725575545

# Generate a menu using fzf
selected_name=$(for name in "${!contacts[@]}"; do echo "$name"; done | fzf --prompt="Select a contact: ")

# Exit if no selection is made
if [[ -z "$selected_name" ]]; then
  echo "No selection made."
  exit 1
fi

# Temporary file for the message
temp_file=$(mktemp)

# Open vim to write the message
vim "$temp_file"

# Check if the message is not empty
if [[ ! -s "$temp_file" ]]; then
  echo "Message is empty. Exiting."
  rm "$temp_file"
  exit 1
fi

# Read the message
message=$(<"$temp_file")

# Get the phone number of the selected contact
phone_number=${contacts[$selected_name]}

# Command to send the message
kdeconnect-cli --name "POCO X3 Pro" --send-sms "$message" --destination "$phone_number"

# Clean up
rm "$temp_file"

echo "Message sent to $selected_name ($phone_number)."

