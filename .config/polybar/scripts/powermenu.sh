#!/bin/sh

chosen=$(printf "  Power Off\n  Restart\n  Logout\n⏾  Sleep\n  Lock" | rofi -dmenu -i -theme-str '@import "powermenu.rasi"')

case "$chosen" in
  "  Power Off") poweroff ;;
  "  Logout") i3-msg exit ;;
  "  Restart") reboot ;;
  "  Lock") lock.sh ;;
  "⏾  Sleep") systemctl suspend;;
  *) exit 1 ;;
esac
