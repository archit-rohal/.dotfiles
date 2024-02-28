#!/bin/bash

# Check if Bluetooth is already running
if systemctl is-active --quiet bluetooth; then
    echo "Bluetooth is already running."
else
    # Start Bluetooth service
    echo "Starting Bluetooth..."
    sudo systemctl start bluetooth

    # Wait for Bluetooth service to start
    sleep 2

    # Check if Bluetooth started successfully
    if systemctl is-active --quiet bluetooth; then
        echo "Bluetooth started successfully."
    else
        echo "Failed to start Bluetooth. Exiting..."
        exit 1
    fi
fi

# Try to connect to the Bluetooth speaker
echo "Attempting to connect to Bluetooth speaker..."
bluetoothctl << EOF
connect F4:4E:FD:07:02:2A
EOF

# Wait for 2 minutes or until connected
timeout=$((SECONDS + 120))
while [ $SECONDS -lt $timeout ]; do
    # Check if the speaker is connected
    if bluetoothctl info F4:4E:FD:07:02:2A| grep -q "Connected: yes"; then
        echo "Connected to Bluetooth speaker."
        exit 0
    fi

    sleep 1
done

# Disconnect and power off Bluetooth
echo "Unable to connect to Bluetooth speaker within 2 minutes."
echo "Powering off Bluetooth..."
bluetoothctl << EOF
disconnect F4:4E:FD:07:02:2A
power off
EOF

echo "Bluetooth powered off."
