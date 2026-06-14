#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

list_wallpapers() {
  for img in "$WALLPAPER_DIR"; do
    [[ -f "$img" ]] || continue
    
    
}

SELECTED=$(ls "$WALLPAPER_DIR" | wofi --dmenu --prompt "Select a wallpaper...")

swww img "$WALLPAPER_DIR/$SELECTED"

notify-send -i $SELECTED "Wallpaper set"
