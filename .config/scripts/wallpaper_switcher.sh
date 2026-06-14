#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers/"

WALLPAPERS=($(ls "$WALLPAPER_DIR"/*.{jpg,jpeg,png} 2> /dev/null))
FILENAMES=("Random")

for WALLPAPER in "${WALLPAPERS[@]}"; do
	BASENAME=$(basename "$WALLPAPER")
	FILENAME_WITHOUT_EXT="${BASENAME%.*}"
	CAPITALIZED_NAME=$(echo "$FILENAME_WITHOUT_EXT" | sed 's/.*/\u&/')
	FILENAMES+=("$CAPITALIZED_NAME")
done

if [ ${#WALLPAPERS[@]} -eq 0 ]; then
	echo "No wallpapers found in $WALLPAPER_DIR"
	exit 1
fi

SELECTED_NAME=$(printf "%s\n" "${FILENAMES[@]}" | wofi --dmenu --prompt="Select a wallpaper")

if [ "$SELECTED_NAME" == "Random" ]; then
	SELECTED=${WALLPAPERS[RANDOM % ${#WALLPAPERS[@]}]}
else
	for i in "${!FILENAMES[@]}"; do
		if [ "${FILENAMES[$i]}" == "$SELECTED_NAME" ]; then
			SELECTED="${WALLPAPERS[$i-1]}"
			break
		fi
	done
fi

if [ -n "SELECTED" ]; then
	awww img "$SELECTED"
else
	echo "No wallpaper selected."
fi
