#!/bin/bash

while true; do
    active_window=$(xdotool getactivewindow)
    windows=$(wmctrl -lG)

    while read -r window; do
        window_id=$(echo "$window" | awk '{print $1}')
        geometry=$(echo "$window" | awk '{print $3, $4, $5, $6}')

        if [[ $window_id == $active_window ]]; then
            x=$(echo "$geometry" | awk '{print $1}')
            y=$(echo "$geometry" | awk '{print $2}')
            width=$(echo "$geometry" | awk '{print $3}')
            height=$(echo "$geometry" | awk '{print $4}')

            xdotool windowmove "$window_id" $((x - 2)) $((y - 2))
            xdotool windowsize "$window_id" $((width + 4)) $((height + 4))
        else
            xdotool windowmove "$window_id" $x $y
            xdotool windowsize "$window_id" $width $height
        fi
    done <<< "$windows"

    sleep 0.5
done
