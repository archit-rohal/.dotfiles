#!/bin/bash
# Quick File Browser for Rofi

# Starting directory for the file browser
START_DIR="$HOME"

# Command to launch Rofi with the filebrowser modi
rofi -modi filebrowser -show filebrowser -file-browser-dir "$START_DIR"

