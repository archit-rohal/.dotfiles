#!/bin/sh

#second solution -
tmp="$(mktemp)"
lfrun -last-dir-path="$tmp" "$@"
if [ -f "$tmp" ]; then
    dir="$(cat "$tmp")"
    # Change the owner of the temp file to the original user.
    # Assuming $SUDO_USER is set and not empty. Otherwise, falls back to $USER.
    chown "${SUDO_USER:-$USER}" "$tmp"
    if [ -d "$dir" ]; then
        cd "$dir"
    fi
    # No need to remove $tmp here, as it will be handled in the .zshrc function.
fi

