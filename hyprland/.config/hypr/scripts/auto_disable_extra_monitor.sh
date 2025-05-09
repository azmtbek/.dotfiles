#!/bin/bash

# Wait for 1-2 seconds to allow detection to complete
sleep 2

# Get all connected monitor names
monitors=$(hyprctl monitors -j | jq -r '.[].name')
count=$(echo "$monitors" | wc -l)

# If two monitors are connected, disable the second
if [ "$count" -eq 2 ]; then
    primary=$(echo "$monitors" | head -n 1)
    secondary=$(echo "$monitors" | tail -n 1)
    hyprctl dispatch dpms off "$primary"
    hyprctl dispatch dpms on "$secondary"
elif [ "$count" -eq 1 ]; then
    # Only one monitor remains — make sure it's enabled
    only=$(echo "$monitors")
    hyprctl dispatch dpms on "$only"
fi

