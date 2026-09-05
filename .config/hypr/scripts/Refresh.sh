#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Scripts for refreshing ags, waybar, rofi, swaync, wallust

SCRIPTSDIR=$HOME/.config/hypr/scripts
UserScripts=$HOME/.config/hypr/UserScripts

# Define file_exists function
file_exists() {
  if [ -e "$1" ]; then
    return 0 # File exists
  else
    return 1 # File does not exist
    echo "file does not exist"
  fi
}

# Kill already running processes
_ps=(waybar rofi mako)
for _prs in "${_ps[@]}"; do
  if pidof "${_prs}" >/dev/null; then
    pkill "${_prs}"
  fi
done

# added since wallust sometimes not applying
killall -SIGUSR2 waybar

# some process to kill
for pid in $(pidof waybar fuzzel mako swaybg); do
  kill -SIGUSR1 "$pid"
done

#Restart waybar
sleep 1
waybar &

# relaunch swaync
sleep 0.5
makoctl reload

# Relaunching rainbow borders if the script exists
sleep 1
if file_exists "${UserScripts}/RainbowBorders.sh"; then
  ${UserScripts}/RainbowBorders.sh &
fi

if file_exists "${SCRIPTSDIR}/Wallpaper.sh"; then
  ${SCRIPTSDIR}/Wallpaper.sh &
fi

exit 0
