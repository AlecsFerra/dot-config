#! /bin/bash

if lsusb -v 2>/dev/null \
   | egrep '(^Bus|Keyboard)' \
   | grep -B1 Keyboar 1>/dev/null; then
    setxkbmap -option grp:alt_shift_toggle us,it &
    echo "set us"
else
    setxkbmap -option grp:alt_shift_toggle it,us &
    echo "set it"
fi
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
