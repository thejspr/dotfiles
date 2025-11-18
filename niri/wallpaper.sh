#!/bin/bash

# unless awww-daemon is already running, start it
pgrep awww-daemon >/dev/null || awww-daemon &

WALLPAPERS_DIR=~/wallpapers
WALLPAPER=$(find "$WALLPAPERS_DIR" -type f | shuf -n 1)

echo "Setting wallpaper to $WALLPAPER"

awww img "$WALLPAPER"
