#!/bin/bash

DISPLAY_MAIN="eDP-1"
DISPLAY_SUB="HDMI-2"
DEVICE="Wacom Intuos4 6x9"
STYLUS="$DEVICE Pen stylus"
ERASER="$DEVICE Pen eraser"
CURSOR="$DEVICE Pen cursor"
PAD="$DEVICE Pad pad"

function set_wacom_device() {
  if [[ $(xrandr --listactivemonitors | grep ${DISPLAY_SUB}) ]]; then
    xsetwacom set "${@}" MapToOutput "$(xrandr | grep ${DISPLAY_SUB} | cut -d " " -f3)"
  else
    xsetwacom set "${@}" MapToOutput "$(xrandr | grep ${DISPLAY_MAIN} | cut -d " " -f4)"
  fi
}

set_wacom_device "${STYLUS}"
set_wacom_device "${ERASER}"
set_wacom_device "${CURSOR}"
set_wacom_device "${PAD}"
