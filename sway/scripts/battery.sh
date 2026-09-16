#!/bin/sh

SYNC=battery

BAT=$(cat /sys/class/power_supply/BAT*/capacity)
STATUS=$(cat /sys/class/power_supply/BAT*/status)

if [ "$STATUS" = "Charging" ]; then
  ICON="󰂄"
elif [ "$BAT" -lt 15 ]; then
  ICON="󰁺"
elif [ "$BAT" -lt 40 ]; then
  ICON="󰁼"
elif [ "$BAT" -lt 70 ]; then
  ICON="󰁾"
else
  ICON="󰂀"
fi

notify-send \
  -a battery \
  -h string:x-canonical-private-synchronous:$SYNC \
  "$ICON  Battery" \
  "$BAT% • $STATUS"
