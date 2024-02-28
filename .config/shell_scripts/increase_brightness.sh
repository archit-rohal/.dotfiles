#!/bin/bash

# Specify the output device
OUTPUT="eDP-1"

# Get the current brightness
current_brightness=$(xrandr --verbose | grep 'Brightness:' | awk '{ print $2 }')

# Calculate the new brightness (increase by 10%)
new_brightness=$(echo "$current_brightness + 0.1" | bc)

# Ensure the new brightness does not exceed 1
if (( $(echo "$new_brightness > 1" | bc -l) )); then
  new_brightness=1
fi

# Set the new brightness
xrandr --output $OUTPUT --brightness $new_brightness

# Send a notification with the new brightness level
notify-send "Brightness" "Level: $(echo "$new_brightness * 100" | bc | awk '{printf "%d\n", $0}')%" -h int:value:"$(echo "$new_brightness * 100" | bc | awk '{printf "%d\n", $0}')" -h string:synchronous:brightness
