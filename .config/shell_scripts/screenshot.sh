#!/bin/bash
filename=~/Pictures/Screenshots/sc-$(date +'%d-%m-%Y-(%I:%M:%S%p)')
maim --select > ${filename}.png
convert ${filename}.png ${filename}.webp
rm ${filename}.png
xclip -selection clipboard -t image/webp -i ${filename}.webp && notify-send -t 1500 'Saved!'
