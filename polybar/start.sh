#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Launch bar1 and bar2
for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    echo monitor
    #MONITOR=$m polybar top &
    #MONITOR=$m polybar bottom &
    MONITOR=$m polybar minimal &
  done
