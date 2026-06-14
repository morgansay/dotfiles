#!/bin/bash

screenshot_path="$HOME/Pictures/Screenshots/$(date +%Y%m%d%H%M%S).png"

grim "$screenshot_path" | wl-copy
notify-send -a "Screenshot" -i "$screenshot_path" "Screenshot taken" "Saved to $screenshot_path"
