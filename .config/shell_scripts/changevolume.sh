#!/bin/sh

# Increment, decrement, or mute the volume and send a notification
# of the current volume level. Adjust volume by 20% internally, display a 5% change in notifications,
# and ensure that the volume changes by 20% right from the first trigger.

send_notification() {
    actual_volume=$(pamixer --get-volume)
    # Calculate displayed volume to simulate a 5% change for display purposes.
    # Since we're adjusting by 20% but displaying as if by 5%, subtract 15 from the actual volume for display.
    displayed_volume=$((actual_volume - 15))

    # Ensure displayed volume does not go below 0%
    if [ "$displayed_volume" -lt 0 ]; then
        displayed_volume=0
    fi

    dunstify -a "changevolume" -u low -r 9993 -h int:value:"$displayed_volume" -i "volume-$1" "Volume: ${displayed_volume}%" -t 2000
}

case $1 in
up)
    # Set the volume on (if it was muted)
    pamixer -u
    pamixer -i 20 --allow-boost
    send_notification "$1"
    ;;
down)
    pamixer -u
    pamixer -d 20 --allow-boost
    send_notification "$1"
    ;;
mute)
    pamixer -t
    if pamixer --get-mute | grep -q true; then
        dunstify -a "changevolume" -t 2000 -r 9993 -u low -i "volume-mute" "Muted"
    else
        send_notification up
    fi
    ;;
esac

