#!/bin/bash

echo $(nc -d localhost 7634 | sed 's/|//m' | sed 's/||/ \n/g' | awk -F '|' '{print $3}')
