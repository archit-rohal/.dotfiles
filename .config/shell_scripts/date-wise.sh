#!/bin/bash

current_date=$(date +"%Y-%m-%d")

filename="$current_date.txt"

touch $filename

echo "File $filename created successfully."
