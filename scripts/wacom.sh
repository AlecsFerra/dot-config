#!/bin/bash
list=$(xsetwacom list devices)

stylus="$(echo "$list" | grep STYLUS | cut -f 2 | sed "s/id: //")"
pad="$(echo "$list" | grep PAD | cut -f 2 | sed "s/id: //")"

case ${1:-"xournal"} in
    xournal)
        xsetwacom set "$stylus" Button 2 "key +ctrl +shift P -ctrl -shift"
        xsetwacom set "$stylus" Button 3 "key +ctrl +shift E -ctrl -shift"
        xsetwacom set "$stylus" PressureCurve 60 100 0 40
        xsetwacom set "$pad" Button 8 "key +ctrl - -ctrl"
        xsetwacom set "$pad" Button 9 "key +ctrl + -ctrl"
        xsetwacom set "$pad" Button 3 "key up"
        xsetwacom set "$pad" Button 1 "key down"
        echo "Mode xournal is set"
        ;;
    *)
        echo "Undefined mode $1"
        exit 3
        ;;
esac

