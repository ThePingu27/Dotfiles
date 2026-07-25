#!/usr/bin/env bash
set -euo pipefail

STATE_FILE="$HOME/.cache/.hyprsunset_state"
TARGET_TEMP="${HYPRSUNSET_TEMP:-4500}"
ICON_MODE="${HYPRSUNSET_ICON_MODE:-sunset}"

ensure_state() {
  [[ -f "$STATE_FILE" ]] || echo "off" > "$STATE_FILE"
}

cmd_toggle() {
  ensure_state
  state="$(cat "$STATE_FILE" || echo off)"

  if pgrep -x hyprsunset > /dev/null 2>&1; then
    pkill -x hyprsunset || true
    sleep 0.2
  fi

  if [[ "$state" == "on" ]]; then
      if command -v hyprsunset > /dev/null 2>&1; then
          nohup hyprsunset -i > /dev/null 2>&1 &
          sleep 0.3 && pkill -x hyprsunset || true
    fi
    echo off > "$STATE_FILE"
    notify-send -u low "Hyprsunset: Disabled" || true
  else
    if command -v hyprsunset > /dev/null 2>&1; then
      nohup hyprsunset -t "$TARGET_TEMP" > /dev/null 2>&1 &
    fi
    echo on > "$STATE_FILE"
    notify-send -u low "Hyprsunset: Enabled" "${TARGET_TEMP}K" || true
  fi
}

cmd_init() {
  ensure_state
  state="$(cat "$STATE_FILE" || echo off)"

  if [[ "$state" == "on" ]];then
    if command -v hyprsunset > /dev/null 2>&1; then
      nohup hyprsunset -t "$TARGET_TEMP" > /dev/null 2>&1 &
    fi
  fi
}

case "${1:-}" in
    toggle) cmd_toggle ;;
    init) cmd_init ;;
    *) echo "usage: $0 [toggle|init]" >&2; exit 2 ;;
esac
