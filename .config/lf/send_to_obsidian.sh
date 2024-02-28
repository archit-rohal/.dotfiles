#!/bin/bash

dest="/home/mark/obsidian-vault/transfer/"

for item in "$@"; do
    itemName=$(basename "$item")
    if [ -d "$item" ]; then
        # If it's a directory, copy it recursively
        cp -r "$item" "$dest"
        dunstify -t 2000 "$itemName sent"
    elif [ -f "$item" ]; then
        # If it's a file, copy it directly
        cp "$item" "$dest"
        dunstify -t 2000 "$itemName sent"
    else
        echo "The item $itemName is neither a file nor a directory."
    fi
done
