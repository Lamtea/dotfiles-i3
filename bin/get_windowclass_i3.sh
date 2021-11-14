#!/bin/bash

PROGNAME=`basename "$0"`

for cmd in xwininfo xprop; do
if ! which $cmd > /dev/null 2>&1; then
echo "$PROGNAME: $cmd: command not found" >&2
exit 1
fi
done
match_int='[0-9][0-9]*'
match_string='".*"'
match_qstring='"[^"\\]*(\\.[^"\\]*)*"' # NOTE: Adds 1 backreference
{
	window_id=`xwininfo -int | sed -nre "s/^xwininfo: Window id: ($match_int) .*$/\1/p"`
	echo "id=$window_id"
	xprop -id $window_id |
	sed -nr \
	-e "s/^WM_CLASS\(STRING\) = ($match_qstring), ($match_qstring)$/instance=\1\nclass=\3/p" \
	-e "s/^WM_WINDOW_ROLE\(STRING\) = ($match_qstring)$/window_role=\1/p" \
	-e "/^WM_NAME\(STRING\) = ($match_string)$/{s//title=\1/; h}" \
	-e "/^_NET_WM_NAME\(UTF8_STRING\) = ($match_qstring)$/{s//title=\1/; h}" \
	-e '${g; p}'
} | sort | tr "\n" " " | sed -r 's/^(.*) $/[\1]\n/'
