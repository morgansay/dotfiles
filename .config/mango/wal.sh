#!/bin/bash

wal -i $HOME/Pictures/Wallpapers
source $HOME/.cache/wal/colors.sh
swww img $wallpaper
mmsg -d reload_config
notify-send "Config reloaded"
