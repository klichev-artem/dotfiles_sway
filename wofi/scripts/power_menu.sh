#!/bin/bash

# Menu options
options="⏻ Power Off\n🔄 Reboot\n🔒 Lock\n💤 Suspend\n🚪 Exit Sway"

# Launch wofi
chosen=$(echo -e "$options" | wofi --dmenu --prompt "Power Menu" --insensitive --cache-file /dev/null)

# Handle selection
case $chosen in
    *"Power Off"*)
        systemctl poweroff
        ;;
    *"Reboot"*)
        systemctl reboot
        ;;
    *"Lock"*)
        # Replace 'swaylock' with your preferred locker if different
        swaylock
        ;;
    *"Suspend"*)
        systemctl suspend
        ;;
    *"Exit Sway"*)
        swaymsg exit
        ;;
esac
