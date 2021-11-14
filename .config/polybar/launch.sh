#!/bin/bash

# displays
DISPLAY_MAIN="eDP-1"
DISPLAY_SUB="HDMI-2"

# When restart i3
if [[ $1 = "restart" ]]; then
	i3-msg restart
	sleep 1
fi

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
[[ $(xrandr --listactivemonitors | grep ${DISPLAY_MAIN}) ]] && polybar main &
[[ $(xrandr --listactivemonitors | grep ${DISPLAY_SUB}) ]] && polybar sub &

echo "Polybar launched..."

