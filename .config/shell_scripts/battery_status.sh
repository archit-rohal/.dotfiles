#!/bin/bash

status=$(acpi -b | awk '{print $3}')

if [ "$status" = "Charging," ]; then
    echo "(C)"  
elif [ "$status" = "Discharging," ]; then
    echo "(D)"  
else
    echo "(N)"
fi
