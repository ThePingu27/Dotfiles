#!/bin/bash

# Script for handling keyboard backlights (using brighnessctl)

get_kbd_backlight() {
	echo $(brightnessctl -d ':white:kbd_backlight' -m | cut -d, -f4)
}

change_kbd_backlight() {
	brightnessctl -d ':white:kbd_backlight' set "$1"
}

case "$1" in
	"--get")
		get_kbd_backlight
		;;
	"--inc")
		change_kbd_backlight "+30%"
		;;
	"--dec")
		change_kbd_backlight "30%-"
		;;
	*)
		get_kbd_backlight
		;;
esac
