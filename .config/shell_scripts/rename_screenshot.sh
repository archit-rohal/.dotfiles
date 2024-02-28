#!/bin/zsh

# Define the directory where screenshots are stored
SCREENSHOT_DIR=~/Pictures/Screenshots

# Find the most recent screenshot
LATEST_SCREENSHOT=$(ls -t $SCREENSHOT_DIR | grep -E '.*\.(jpg|png|jpeg)$' | head -n 1)

# Check if a screenshot was found
if [ -z "$LATEST_SCREENSHOT" ]; then
    echo "No screenshot found in $SCREENSHOT_DIR"
    exit 1
fi

# Get the file extension
EXTENSION="${LATEST_SCREENSHOT##*.}"

# Show the original name of the screenshot
echo "Original name: $LATEST_SCREENSHOT"

# Ask for the new name (without extension)
echo "Enter the new name for the screenshot (without extension):"
read NEW_NAME

# Rename the screenshot
mv "$SCREENSHOT_DIR/$LATEST_SCREENSHOT" "$SCREENSHOT_DIR/$NEW_NAME.$EXTENSION"

echo "Screenshot has been renamed to $NEW_NAME.$EXTENSION"

#Add this shell script to an alias like this so that it goes to the 'Screenshots' folder - 
# alias ms = '~/shell_scripts/rename_screenshot.sh; cd ~/Pictures/Screenshots/'
