#!/bin/bash

echo $(nc localhost 7634 |sed 's/|//m' | sed 's/||/ \n/g' | awk -F'|' '{print "hdd: " $3 "°C" }')

