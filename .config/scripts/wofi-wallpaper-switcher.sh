#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

# Generate image list
LIST=""
for img in "$WALL_DIR"/*.{jpg,jpeg,png,webp,JPG,JPEG,PNG,WEBP}; do
  if [ -f "$img" ]; then
    LIST+="img:$img:text:$img\n"
  fi
done

mapfile -t wallpapers < <(find "$WALLPAPER_DIR" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" -o -iname "*.bmp" \) -printf "%f\n" | sort)

echo "$LIST"

SELECTED=$(echo -e "$LIST" | wofi --dmenu --allow-images --prompt "Select wallpaper")

if [ -z "$SELECTED" ]; then
  exit 0
fi

SELECTED=$(echo "$SELECTED" | tr -d '\n\r')

echo "$SELECTED"
matugen --source-color-index 0 image "$SELECTED"

notify-send "Theme updated" "Wallpaper: $(basename "$SELECTED")" -i "$SELECTED"
