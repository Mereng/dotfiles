#!/bin/sh
chosen=$(printf "Suspend\nReboot\nPoweroff" | fuzzel --dmenu --lines 3)
case "$chosen" in 
  Suspend)
    systemctl suspend
    ;;
  Reboot)
    systemctl reboot
    ;;
  Poweroff)
    systemctl poweroff
    ;;
esac
