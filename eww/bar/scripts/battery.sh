#! /bin/bash

bat=/sys/class/power_supply/BAT0/
per="$(cat "$bat/capacity")"

changemode(){
    if tlp-stat -s | grep -q 'Mode           = AC' ; then
        sudo tlp bat
        mode="Power saving mode enabled 😴"
    else
        sudo tlp ac
        mode="Performance mode enabled 😈"
    fi

    notify-send "Mode updated" "$mode" -i battery
}

percent() {
    echo $per
}

icon() {
    if [ $(cat "$bat/status") = "Charging" ]; then
        if [ "$per" -gt "90" ]; then
            icon=""
        elif [ "$per" -gt "80" ]; then
            icon=""
        elif [ "$per" -gt "70" ]; then
            icon=""
        elif [ "$per" -gt "60" ]; then
            icon=""
        elif [ "$per" -gt "50" ]; then
            icon=""
        elif [ "$per" -gt "40" ]; then
            icon=""
        elif [ "$per" -gt "30" ]; then
            icon=""
        elif [ "$per" -gt "20" ]; then
            icon=""
        elif [ "$per" -gt "10" ]; then
            icon=""
        elif [ "$per" -gt "0" ]; then
            icon=""
        else
            icon=""
        fi
    else
        if [ "$per" -gt "90" ]; then
            icon=""
        elif [ "$per" -gt "80" ]; then
            icon=""
        elif [ "$per" -gt "70" ]; then
            icon=""
        elif [ "$per" -gt "60" ]; then
            icon=""
        elif [ "$per" -gt "50" ]; then
            icon=""
        elif [ "$per" -gt "40" ]; then
            icon=""
        elif [ "$per" -gt "30" ]; then
            icon=""
        elif [ "$per" -gt "20" ]; then
            icon=""
        elif [ "$per" -gt "10" ]; then
            icon=""
        elif [ "$per" -gt "0" ]; then
            icon=""
        else
            icon=""
        fi
    fi

    echo $icon
}

case $1 in
  "icon")       icon;;
  "percent")    percent;;
  "changemode") changemode;;
esac
