#!/bin/bash

player_status=$(playerctl status 2> /dev/null)
if [[ $? -eq 0 ]]; then
    metadata="$(playerctl metadata title 2>/dev/null)"
fi

if [[ $player_status = "Playing" ]]; then
    out="$metadata"
elif [[ $player_status = "Paused" ]]; then
    out="$metadata"
else
    out=""
fi

echo "$out" | awk -v len=25 '{ if (length($0) > len) print substr($0, 1, len-3) "..."; else print; }'
