#!/bin/bash
#screenshotting script that notes date and time in screenshot directory
file="$HOME/Pics/screenshots/grim_$(date +%Y%m%d_%H%M%S).png"

grim -g "$(slurp -w 0)" $file
