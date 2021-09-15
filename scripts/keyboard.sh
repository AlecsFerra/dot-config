#! /bin/dash

if lsusb -v 2>/dev/null \
   | grep "Microdia USB Keyboard" 1>/dev/null
then
    setxkbmap -option caps:swapescape \
              -option lv3:ralt_switch_multikey \
              -option grp:alt_shift_toggle us,it &
    echo us
else
    setxkbmap -option caps:swapescape \
              -option lv3:ralt_switch_multikey \
              -option grp:alt_shift_toggle it,us &
    echo it
fi
