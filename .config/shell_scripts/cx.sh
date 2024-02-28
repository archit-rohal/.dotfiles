#!/bin/sh

# Check if a filename was provided
if [ -z "$1" ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# Check if the file exists
if [ ! -f "$1" ]; then
    echo "File $1 does not exist."
    exit 1
fi

# Make the file executable
chmod 755 "$1"

notify-send -t 1500 "$1 is now executable."
