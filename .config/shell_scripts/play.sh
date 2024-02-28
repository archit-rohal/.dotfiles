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

# Fetch format information
format_info=$(yt-dlp -F "$YOUTUBE_URL")

# Check if fetching was successful
if [ $? -ne 0 ]; then
    echo "Failed to fetch video formats."
    exit 1
fi

# Extract webm video formats with at least 1080p resolution
webm_video_formats=$(echo "$format_info" | awk '$2 == "webm" && ($3 ~ /[0-9]+x[0-9]+/ && $3 >= 1920 && $4 >= 1080)')

# If webm formats are available, select the one with the smallest file size
if [ ! -z "$webm_video_formats" ]; then
    video_format=$(echo "$webm_video_formats" | sort -k5,5 -n | head -n 1 | awk '{print $1}')
else
    # If no webm, select the smallest video of any format with the required resolution
    video_format=$(echo "$format_info" | awk '$2 ~ /(mp4|webm)/ && $3 ~ /[0-9]+x[0-9]+/ { split($3, res, "x"); if (res[1] >= 1920 && res[2] >= 1080) print }' | sort -k5,5 -n | head -n 1 | awk '{print $1}')
fi

# Extract audio formats and pick the one with the smallest file size
audio_format=$(echo "$format_info" | awk '/audio only/ {print $0}' | sort -k5 -n | head -n 1 | awk '{print $1}')

# Check if video format was found
if [ -z "$video_format" ]; then
    echo "No suitable video formats found."
    exit 1
fi

# Download the video using yt-dlp to the temporary location
echo "Downloading video in preferred resolution and format..."
yt-dlp -f "$video_format+$audio_format" -o "$TEMP_BASE_PATH.%(ext)s" -- "$YOUTUBE_URL"

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

