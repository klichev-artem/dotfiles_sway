#!/bin/bash

# ===== Цвета =====
C_WIFI="#6cb6eb"
C_LAYOUT="#e5c07b"
C_BT="#98c379"
C_BAT="#e06c75"
C_DATE="#c678dd"
C_VOL="#56b6c2"

# ===== Иконки (minimal / nerd) =====
I_WIFI=" 󰖩"
I_LAYOUT=" ⌨"
I_BT=" "
I_BAT=" 󰁹"
I_DATE=" 󰃭"
I_VOL=" "
I_MUTE=" "

while true; do
    # Wi-Fi
    WIFI=$(nmcli -t -f ACTIVE,SSID dev wifi | grep '^yes' | cut -d: -f2)
    [ -z "$WIFI" ] && WIFI="OFF"

    # Раскладка
    LAYOUT=$(swaymsg -t get_inputs | grep xkb_active_layout_name | head -n1 | cut -d '"' -f4)

    # Bluetooth
    BT=$(bluetoothctl show | awk '/Powered/ {print $2}')
    [ "$BT" = "yes" ] && BT="ON" || BT="OFF"

    # Батарея
    BAT=$(cat /sys/class/power_supply/BAT0/capacity 2>/dev/null || echo "AC")
    STATUS=$(cat /sys/class/power_supply/BAT0/status 2>/dev/null || echo "")

    # Дата
    DATE=$(date '+%d %b %H:%M')

    # Звук (PipeWire)
    VOL_RAW=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
    if echo "$VOL_RAW" | grep -q MUTED; then
        VOL="$I_MUTE mute"
    else
        VOL_PCT=$(echo "$VOL_RAW" | awk '{print int($2*100)}')
        VOL="$I_VOL ${VOL_PCT}%"
    fi

    echo "<span foreground='$C_LAYOUT'>$I_LAYOUT $LAYOUT </span>  \
<span foreground='$C_VOL'>$VOL </span> \
<span foreground='$C_WIFI'>$I_WIFI $WIFI </span>  \
<span foreground='$C_BT'>$I_BT $BT </span>  \
<span foreground='$C_BAT'>$I_BAT $BAT% </span>  \
<span foreground='$C_DATE'>$I_DATE $DATE </span> "
    sleep 5
done


