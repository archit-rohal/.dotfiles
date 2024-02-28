#!/bin/bash

shopt -s nullglob globstar

# switch for autotyping
typeit=0
if [[ $1 == "--type" ]]; then
    typeit=1
    shift
fi

# get all the saved password files
prefix=${PASSWORD_STORE_DIR-~/.password-store}
password_files=( "$prefix"/**/*.gpg )
password_files=( "${password_files[@]#"$prefix"/}" )
password_files=( "${password_files[@]%.gpg}" )

# shows a list of all password files and saves the selected one in a variable
password=$(printf '%s\n' "${password_files[@]}" | rofi -dmenu "$@" -theme ~/.config/rofi/config.rasi)
[[ -n $password ]] || exit

# pass show outputs the password and username. Save both in separate variables.
password_info=$(pass show "$password")

# Copy the entire password info to clipboard with a gap between the two lines
echo -e "$password_info" | awk '{printf "%s%s", $0, (NR%2 ? OFS : ORS)}' | xclip -selection clipboard

# Rest of your script remains unchanged
if [[ $typeit -eq 0 ]]; then
    # No need to pass show -c here, as we've already copied to clipboard
    echo -e "$password_info"
else
    # If using autotype, use the variables passw and uname
    passw=$(echo "$password_info" | sed -n '1p')
    uname=$(echo "$password_info" | sed -n '2p')
    xdotool type "$uname"
    xdotool key Tab
    xdotool type "$passw"
    xdotool key Tab
fi
