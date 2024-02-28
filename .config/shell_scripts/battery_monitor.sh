#!/bin/bash

# Path to the battery capacity file
BATTERY_PATH="/sys/class/power_supply/BAT0/capacity"
# Path to the battery status file
STATUS_PATH="/sys/class/power_supply/BAT0/status"

# Threshold for low and full battery level
LOW_THRESHOLD=5
FULL_THRESHOLD=100

while true; do
    # Read battery status and capacity
    capacity=$(cat "$BATTERY_PATH")
    status=$(cat "$STATUS_PATH")

    # Check if battery level is below low threshold and is discharging
    if [ "$capacity" -le $LOW_THRESHOLD ] && [ "$status" = "Discharging" ]; then
        # Send notification for low battery
        noti -t "Battery Low" -m "Battery level is at ${capacity}%!"
    fi

    # Check if battery level is at full threshold and is charging
    if [ "$capacity" -eq $FULL_THRESHOLD ] && [ "$status" = "Charging" ]; then
        # Send notification for full battery
        noti -t "Battery Full" -m "Battery level is at ${capacity}%. Please unplug the charger."
    fi

    # Sleep for a while before checking again
    sleep 60  # 60 seconds (1 minute)
done
