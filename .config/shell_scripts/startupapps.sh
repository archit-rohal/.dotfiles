#!/bin/bash

# Function to switch to a specific tag
switch_to_tag() {
    # Simulate Alt+Key press to switch tags
    xdotool keydown Alt key $1 keyup Alt
}

# Function to launch and detach a process from the terminal
launch_detached() {
    nohup "$@" >/dev/null 2>&1 &
}

# Launch applications in specific tags

# Tag 1: Firefox
switch_to_tag u
launch_detached thorium-browser 

# Sleep a bit to allow the previous command to execute
sleep 1

# Tag 2: ws and another Firefox instance
switch_to_tag i
# Uncomment and modify the next line if ws is an executable that needs to be run
launch_detached ws
launch_detached thorium-browser --new-window http://127.0.0.1:5500/

# Sleep a bit
sleep 7

# Tag 3: Google Chrome with a specific URL
switch_to_tag o
launch_detached code

# Sleep a bit
sleep 1 

# Tag 4: Visual Studio Code
switch_to_tag p
launch_detached /home/mark/appimages/obsidian/Obsidian-1.4.14.AppImage

# Ensure all processes are launched in background and detached
#disown -a

# Exit the terminal
#exit
