#!/bin/bash
# Gracefully restart PulseAudio and ensure Bluetooth service is ready for auto-connect
pulseaudio -k
sleep 1
pulseaudio --start
