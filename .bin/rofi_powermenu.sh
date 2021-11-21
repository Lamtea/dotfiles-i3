#!/bin/bash

#lock_command="xscreensaver-command -l"
lock_command="light-locker-command -l"
logout_command="i3-msg exit"
suspend_command="systemctl suspend"
hibernate_command="systemctl hibernate"
reboot_command="systemctl reboot"
shutdown_command="systemctl poweroff"
options=$'lock\nlogout\nsuspend\nhibernate\nreboot\nshutdown'
eval \$"$(echo "$options" | rofi -dmenu -p "")_command"
