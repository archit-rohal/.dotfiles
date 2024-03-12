#!/bin/bash

# Define the target device name
deviceName="POCO X3 Pro"

# Prompt the user to choose between sending a URL, a file, or clipboard content
echo "Press 'u' to send a URL, 'f' to send a file, or 'c' to share clipboard."
read -n 1 -s choice # -n 1: read single character, -s: silent mode (no echo)

echo # New line for clean output

case "$choice" in
  u)
    # If the choice is 'u', ask for a URL
    echo "Enter the URL to send:"
    read url
    # Use kdeconnect-cli to share the URL with the specified device
    kdeconnect-cli --share "$url" -n "$deviceName"
    echo "URL '$url' has been sent to device '$deviceName'."
    ;;
  f)
    # If the choice is 'f', use fzf to select a file from /home/mark/, excluding hidden files
    selectedFile=$(find /home/mark/ -type f ! -path '*/\.*' | fzf)

    # Check if a file was selected
    if [ -z "$selectedFile" ]; then
      echo "No file selected. Exiting."
      exit 1
    fi

    # Use kdeconnect-cli to share the selected file with the specified device
    kdeconnect-cli --share "$selectedFile" -n "$deviceName"
    echo "File '$selectedFile' has been sent to device '$deviceName'."
    ;;
  c)
    # If the choice is 'c', share the clipboard content
    clipboardContent=$(xclip -o -selection clipboard)
    if [ -z "$clipboardContent" ]; then
      echo "Clipboard is empty. Exiting."
      exit 1
    fi

    # Use kdeconnect-cli to share the clipboard content with the specified device
    kdeconnect-cli --share-text "$clipboardContent" -n "$deviceName"
    echo "Clipboard content has been sent to device '$deviceName'."
    ;;
  *)
    echo "Invalid choice. Exiting."
    exit 1
    ;;
esac

