#!/bin/zsh

# Function to check the size of a directory
get_directory_size() {
  du -s "$1" | awk '{print $1}'
}

# Path to the 'Trash' directory
TRASH_DIR="$HOME/.local/share/Trash"

# Size limit in bytes (3GB = 3 * 1024 * 1024 * 1024)
SIZE_LIMIT=$((3 * 1024 * 1024 * 1024))

# Get the current size of the 'Trash' directory
current_size=$(get_directory_size "$TRASH_DIR")

# Convert the size limit to human-readable format
size_limit_human=$(numfmt --to=iec-i --suffix=B $SIZE_LIMIT)

# Check if the current size exceeds the limit
if ((current_size > SIZE_LIMIT)); then
  echo "The size limit of $size_limit_human is crossed. Cannot perform trash-put operation."
else
  # Proceed with the trash-put operation
  trash-put "$@"
fi
