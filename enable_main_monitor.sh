#!/bin/bash

# Get all connected monitors
monitors=$(hyprctl monitors -j | jq -r '.[].name')

# Count connected monitors
count=$(echo "$monitors" | wc -l)

# If two monitors are connected, disable the second
if [ "$count" -eq 2 ]; then
    primary=$(echo "$monitors" | head -n 1)
    secondary=$(echo "$monitors" | tail -n 1)
    hyprctl dispatch dpms on "$primary"
fi

