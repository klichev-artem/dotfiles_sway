#!/bin/sh

# Получаем текущую раскладку клавиатуры
LAYOUT=$(swaymsg -t get_inputs \
  | jq -r '.[] | select(.type=="keyboard") | .xkb_active_layout_name' \
  | head -n1)

case "$LAYOUT" in
  *English*) LAYOUT_ICON="EN" ;;
  *Russian*) LAYOUT_ICON="RU" ;;
  *) LAYOUT_ICON="$LAYOUT" ;;
esac

# Запускаем swaylock
swaylock \
    --clock \
    --show-failed-attempts \
    --show-keyboard-layout \
    --layout-text "$LAYOUT_ICON" \
    --text-color FFFFFF \
    --clock-color FFFFFF \
    --layout-text-color FFFFFF \
    --line-uses-inside \
    --inside-color 00000033 \
    --ring-color FFFFFF33 \
    --line-color FFFFFF33 \
    --indicator-radius 100 \
    --indicator-thickness 5
