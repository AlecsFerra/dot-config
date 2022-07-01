#!/bin/bash

lock="$HOME/.fprint-disabled"

echo "hi"
if grep -Fq closed /proc/acpi/button/lid/LID0/state &&
   grep -Fxq connected /sys/class/drm/card0-HDMI-A-1/status
then
  touch "$lock"
  systemctl stop fprintd
  systemctl mask fprintd
elif [ -f "$lock" ]
then
  systemctl unmask fprintd
  systemctl start fprintd
  rm "$lock"
fi

