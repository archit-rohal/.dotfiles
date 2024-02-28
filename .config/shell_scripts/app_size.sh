#!/bin/bash

read -p "Enter the package name: " package_name

size=$(apt-cache show "$package_name" | awk '/^Size: / { print $2 }' | numfmt --to=iec --suffix=B --padding=7)

echo "Package size: $size"

