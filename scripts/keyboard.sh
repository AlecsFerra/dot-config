#! /bin/dash

if lsusb -v 2>/dev/null \
   | grep "Microdia USB Keyboard" 1>/dev/null
then
    setxkbmap -option caps:swapescape
              #-option grp:alt_shift_toggle us,it &
    echo us
else
    setxkbmap -option caps:swapescape \
              -layout it
              #-option grp:alt_shift_toggle it,us &
    echo it
fi
