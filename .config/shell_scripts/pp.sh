#!/bin/bash

content=$(xclip -o 2>/dev/null)
if [ -n "$content" ]; then
  mpv "$content" & disown
  exit
fi
