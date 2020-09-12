#!/bin/bash
intern=eDP-1
extern=HDMI-1

if xrandr | grep "$extern disconnected"; then
    echo single
    xrandr --output "$intern" --auto
    bspc monitor $intern -d 1 2 3 4 5 6 7 8 9 10
else
    echo multi
    xrandr --output "$extern" --left-of "$intern" --auto --primary
    bspc monitor $extern -d 1 2 3 4 5
    bspc monitor $intern -d 6 7 8 9 10
fi
