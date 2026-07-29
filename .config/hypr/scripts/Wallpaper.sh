#!/bin/bash

WALLPAPER_DIR="/home/pingu/Pictures/Wallpaper"

# Set the default wallpaper upon startup
DEFAULT_WALLPAPER="$WALLPAPER_DIR/ember.png"

# Get a random wallpaper from the folder
WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" \) | shuf -n 1)

# Check if a wallpaper was found
if [ -z "$WALLPAPER" ]; then
  swaybg -i $DEFAULT_WAllPAPER
  echo "default wallpaper applied"
else
  swaybg -i $WALLPAPER
  echo "wallpaper updated"
fi
