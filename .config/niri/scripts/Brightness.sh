#!/bin/bash

# Script for handling monitor (using brightnessctl)

notification_timeout=1000
step=10 #increment/decrement value

get_brightness() {
	brightnessctl -m | cut -d, -f4 | tr -d '%'
}
change_brightness() {
	local delta=$1
	local current new

	current=$(get_brightness)
	new=$((current + delta))

	# Clamp between 5 - 100
	(( new < 5 )) && new=5
	(( new > 100)) && new=100

	brightnessctl set "${new}%"
}

case "$1" in
	"--get")
		get_brightness
		;;
	"--inc")
		change_brightness "$step"
		;;
	"--dec")
		change_brightness "-$step"
		;;
	*)
		get_brightness
		;;
esac
