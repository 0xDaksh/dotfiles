#!/bin/bash

player_status=$(playerctl status 2> /dev/null)
if [[ $? -eq 0 ]]; then
    metadata="$(playerctl metadata artist 2>/dev/null) - $(playerctl metadata title 2>/dev/null)"
fi

if [[ $player_status = "Playing" ]]; then
    echo "$metadata"
elif [[ $player_status = "Paused" ]]; then
    echo "$metadata"
else
    echo "" # Greyed out icon when stopped
fi
