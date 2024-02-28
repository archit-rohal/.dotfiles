#!/bin/bash

# Check if a URL has been provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <youtube-url>"
    exit 1
fi

# Define the YouTube URL
YOUTUBE_URL=$1

# Define a base file path in /tmp directory without an extension
TEMP_BASE_PATH="/tmp/$(date +%s%N)"

# Download the video using yt-dlp to the temporary location
# Use -o to specify output template without an extension
echo "Downloading video..."
yt-dlp -o "$TEMP_BASE_PATH.%(ext)s" -- "$YOUTUBE_URL"

# Find the downloaded file, assuming it's the only one with the base name
DOWNLOADED_FILE=$(find /tmp -type f -name "$(basename $TEMP_BASE_PATH).*" | head -n 1)

# Check if a file was found
if [ -f "$DOWNLOADED_FILE" ]; then
    echo "Download complete. Playing the video..."
    # Play the video
    mpv -- "$DOWNLOADED_FILE"
    # Delete the video after watching
    echo "Deleting the video..."
    rm -f -- "$DOWNLOADED_FILE"
    # Exit the script
    exit 0
else
    echo "Failed to download the video."
    exit 1
fi
