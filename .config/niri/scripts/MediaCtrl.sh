#!/bin/bash

# Play next track
play_next() {
    playerctl next
}

# Play previous track
play_previous() {
    playerctl previous
}

# Play/pause function
toggle_play_pause() {
    playerctl play-pause
}

# Stop fucntion
stop_playback() {
    playerctl stop
}

# Hnadler to determine which function to invoke
case "$1" in
    "--nxt")
        play_next
        ;;
    "--prv")
        play_previous
        ;;
    "--pause")
        toggle_play_pause
        ;;
    "--stop")
        stop_playback
        ;;
    *)
        echo "[--nxt | --prv | --pause | --stop]"
        exit 1
        ;;
esac
