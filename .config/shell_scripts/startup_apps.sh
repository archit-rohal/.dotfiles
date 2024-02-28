#!/bin/bash

# Function to switch to a specific tag
switch_to_tag() {
    # Simulate Alt+Key press to switch tags
    xdotool keydown Alt key $1 keyup Alt
}

# Function to launch a process in the background
launch_background() {
    "$@" >/dev/null 2>&1 &
}

# Launch applications in specific tags

# Tag 1: Firefox
switch_to_tag u
launch_background thorium-browser 

# Sleep a bit to allow the previous command to execute
sleep 1

# Tag 2: ws and another Firefox instance
switch_to_tag i
# Uncomment and modify the next line if ws is an executable that needs to be run
launch_background ws
launch_background thorium-browser --new-window http://127.0.0.1:5500/

# Sleep a bit
sleep 7

# Tag 3: Google Chrome with a specific URL
switch_to_tag o
launch_background google-chrome --app="https://chat.openai.com"

# Sleep a bit
sleep 1 

# Tag 4: Visual Studio Code
switch_to_tag p
launch_background code

# Sleep a bit
sleep 2

# Tag 5: Obsidian
switch_to_tag w
launch_background /home/mark/appimages/obsidian/Obsidian-1.4.14.AppImage

# Exit the terminal
#exit
