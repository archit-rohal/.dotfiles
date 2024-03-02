#!/bin/sh
picom --experimental-backends -b
#picom -b
kdeconnect &
setxkbmap -option "ctrl:swapcaps" &
syncthing -no-browser &
dunst &
slstatus &
feh --bg-scale "/home/mark/Pictures/wallpapers/5m5kLI9.png" &
/home/mark/.config/shell_scripts/battery_monitor.sh &
xdotool key Alt+grave
exec dbus-run-session -- dwm
