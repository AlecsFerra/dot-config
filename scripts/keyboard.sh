#! /bin/dash

if lsusb -v 2>/dev/null \
   | grep "Microdia USB Keyboard" 1>/dev/null
then
    setxkbmap -option caps:swapescape \
              -option grp:alt_shift_toggle us,it &
#              -option lv3:ralt_switch_multikey \
    echo us
else
    setxkbmap -option caps:swapescape \
              -option grp:alt_shift_toggle it,us &
#              -option lv3:ralt_switch_multikey \
    echo it
fi
