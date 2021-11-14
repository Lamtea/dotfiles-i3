#!/bin/bash

DEVICE="SynPS/2 Synaptics TouchPad"

if [[ $# -ne 1 ]]; then
  echo "Usage: $(basename $0) [on|off]"
  exit 1
fi

if [[ ${1} == "on" ]]; then
  xinput set-prop "${DEVICE}" "Device Enabled" 1
elif [[ ${1} == "off" ]]; then
  xinput set-prop "${DEVICE}" "Device Enabled" 0
fi
