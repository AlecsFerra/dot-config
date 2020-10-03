#!/bin/bash
intern=eDP-1
extern=HDMI-1

if xrandr | grep "$extern disconnected"; then
    echo single
    xrandr --output "$intern" --auto
else
    echo multi
    xrandr --output "$extern" --left-of "$intern" --auto
fi

