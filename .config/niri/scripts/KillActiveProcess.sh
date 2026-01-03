#!/bin/bash

# Get id of an active window
active_pid=$(niri msg windows | grep -4 "focused" | grep -P "(PID: )[\d]{2,5}" | cut -c 8-13)
# Close active window
kill $active_pid
