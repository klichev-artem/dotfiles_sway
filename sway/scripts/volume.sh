#!/bin/sh

STEP=5
SYNC=volume

case "$1" in
  up)
    wpctl set-volume @DEFAULT_AUDIO_SINK@ ${STEP}%+
    ;;
  down)
    wpctl set-volume @DEFAULT_AUDIO_SINK@ ${STEP}%-
    ;;
  mute)
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    ;;
esac

VOL_RAW=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
VOL=$(echo "$VOL_RAW" | awk '{print int($2*100)}')

if echo "$VOL_RAW" | grep -q MUTED; then
  ICON=""
  TEXT="Muted"
else
  if [ "$VOL" -lt 30 ]; then
    ICON=""
  elif [ "$VOL" -lt 70 ]; then
    ICON=""
  else
    ICON=""
  fi
  TEXT="${VOL}%"
fi

notify-send \
  -a volume \
  -h string:x-canonical-private-synchronous:$SYNC \
  "$ICON  Volume" \
  "$TEXT"
