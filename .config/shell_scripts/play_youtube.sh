#!/bin/bash

# Check if the browser is running
if pgrep -x "firefox" >/dev/null; then
    # Get the current URL from the active tab
    current_url=$(xdotool getactivewindow getwindowname | grep -oP '(?<=\btitlebar\b \(Page Title: )[^)]*' | xargs -0 printf "%b" | xclip -selection clipboard -o)
    
    # Check if the URL is from YouTube
    if echo "$current_url" | grep -q "youtube.com"; then
        # Download the video using YouTube-dl and play it with mpv
        youtube-dl -g "$current_url" | xargs mpv
    else
        echo "The current tab does not contain a YouTube video."
    fi
else
    echo "The browser is not running."
fi
