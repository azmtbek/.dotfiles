#!/bin/bash

# wait for monitors to settle
sleep 2

monitors=$(hyprctl monitors -j | jq -r '.[].name')
count=$(echo "$monitors" | wc -l)

if [ "$count" -eq 2 ]; then
    primary=$(echo "$monitors" | head -n 1)
    secondary=$(echo "$monitors" | tail -n 1)
    hyprctl dispatch dpms on "$secondary"
    hyprctl dispatch dpms off "$primary"
elif [ "$count" -eq 1 ]; then
    only=$(echo "$monitors")
    hyprctl dispatch dpms on "$only"
fi

