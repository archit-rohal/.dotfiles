#!/bin/bash

# The path to the file to open
FILE="$1"

# Determine the MIME type or extension of the file
MIME_TYPE=$(xdg-mime query filetype "$FILE")
EXTENSION="${FILE##*.}"

# Define your default editor, replace 'nvim' with your editor if different
EDITOR='nvim'

# List of MIME types or extensions not to use `devour` with
# Add or remove types/extensions based on your preferences
NO_DEVOUR_EXTENSIONS="txt md"

# Use `devour` for files except those matching certain conditions
if [[ "$NO_DEVOUR_EXTENSIONS" =~ $EXTENSION ]]; then
    # Open with the default editor without `devour`
    $EDITOR "$FILE"
else
    # For other types, use `devour` to open them
    devour xdg-open "$FILE"
fi

