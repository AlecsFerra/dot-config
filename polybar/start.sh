#!/usr/bin/env bash

intern=eDP-1
extern=HDMI-1

if xrandr | grep "$extern disconnected"; then
	MONITOR=$intern polybar minimal &
else
	MONITOR=$intern polybar minimal &
fi
