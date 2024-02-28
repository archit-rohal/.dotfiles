#!/bin/bash

pid=$(ps aux | awk '{print $0}' | fzf --header='Select a process to kill' --preview-window=hidden | awk '{print $2}')

if [ -n "$pid" ]; then
    echo "Killing process $pid ..."
    pkill -P "$pid"
    kill "$pid"
else
    echo "No process selected."
fi
