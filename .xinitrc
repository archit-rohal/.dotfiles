#!/bin/sh
picom --experimental-backends -b
#picom -b
#kdeconnect-cli &
setxkbmap -option "ctrl:swapcaps" &
syncthing -no-browser &
dunst &
slstatus &
feh --bg-scale "/home/mark/Pictures/wallpapers/forest_trees_glow_1101155_1920x1080.jpg" &
/home/mark/.config/shell_scripts/battery_monitor.sh &
xdotool key Alt+grave
exec dbus-run-session -- dwm
