#!/bin/sh

chosen=$(printf "  Power Off\n  Restart\n  Logout\n⏾  Sleep\n " | rofi -dmenu -i -theme-str '@import "powermenu.rasi"')

case "$chosen" in
  "  Power Off") poweroff ;;
  "  Logout") i3-msg exit ;;
  "  Restart") reboot ;;
  "⏾  Sleep") systemctl suspend;;
  *) exit 1 ;;
esac
