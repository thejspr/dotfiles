#!/bin/bash
options="Shutdown\nReboot\nLogout\nSuspend\nHibernate\nLock\nExit"
chosen=$(echo -e "$options" | fuzzel --dmenu --prompt "**Power Menu**" --lines 7)

case $chosen in
  "Shutdown") systemctl poweroff ;;
  "Reboot")   systemctl reboot ;;
  "Logout")   niri msg action quit --skip-confirmation ;;
  "Suspend")  systemctl suspend ;;
  "Hibernate") systemctl hibernate ;;
  "Lock")     swaylock ;;
  "Exit")     exit 0 ;;
  *)          exit 1 ;;
esac
