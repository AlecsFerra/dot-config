#!/usr/bin/env bash

intern=eDP1
extern=HDMI1

if xrandr | grep "$extern disconnected"; then
	MONITOR=$intern polybar minimal &
else
	MONITOR=$extern polybar minimal &
fi
