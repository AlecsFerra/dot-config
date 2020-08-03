#!/bin/sh

if tlp-stat -s | grep -q 'Mode           = AC' ; then
    sudo tlp bat
    mode="Power saving mode enabled 😴"
else
    sudo tlp ac
    mode="Performance mode enabled 😈"
fi

echo lol
notify-send "Mode updated" "$mode" -i battery
