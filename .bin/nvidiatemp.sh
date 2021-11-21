#!/bin/bash

GPUTEMP=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader)
if [[ ! ${GPUTEMP} =~ ^[0-9]+$ ]]; then
  echo "missing"
else
  echo "${GPUTEMP}"
fi
