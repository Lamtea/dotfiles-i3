#!/bin/bash

XRANDR="xrandr"
CMD="${XRANDR}"
declare -A VOUTS
eval VOUTS=$(${XRANDR} | awk 'BEGIN {printf("(")} /^\S.*connected/{printf("[%s]=%s ", $1, $2)} END{printf(")")}')

PRIMARY_NAME="eDP-1"

xrandr_params_for() {
  if [[ "${1}" == "${PRIMARY_NAME}" ]]; then
    CMD="${CMD} --output ${1} --auto --primary"
    return 0
  elif [[ "${2}" == 'connected' ]]; then
    CMD="${CMD} --output ${1} --auto --scale 0.8 --above ${PRIMARY_NAME}"
    return 0
  else
    CMD="${CMD} --output ${1} --off"
    return 1
  fi
}

for VOUT in ${!VOUTS[*]}; do
  xrandr_params_for ${VOUT} ${VOUTS[${VOUT}]}
done

set -x
${CMD}
set +x

