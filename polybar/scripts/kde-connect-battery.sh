#! /bin/bash

device_id="18670d10550d4c33"
device_name="X3"

is_reach="$(qdbus org.kde.kdeconnect "/modules/kdeconnect/devices/$device_id" org.kde.kdeconnect.device.isReachable)"

if $is_reach; then
    battery="$(qdbus org.kde.kdeconnect "/modules/kdeconnect/devices/$device_id/battery" org.kde.kdeconnect.device.battery.charge)"
    is_charging="$(qdbus org.kde.kdeconnect "/modules/kdeconnect/devices/$device_id/battery" org.kde.kdeconnect.device.battery.isCharging)"
    if $is_charging; then
        icon=""
        #case $battery in
        #    [0-9]) icon="" ;;
        #    100) icon="" ;;
        #    9*) icon="" ;;
        #    8*|7*) icon="" ;;
        #    6*|5*) icon="" ;;
        #    4*|3*) icon="" ;;
        #    *) icon="" ;;
        #esac
    else
        icon=""
        #case $battery in
        #    [0-9]) icon="" ;;
        #    100) icon="" ;;
        #    9*) icon="" ;;
        #    8*|7*) icon="" ;;
        #    6*|5*) icon="" ;;
        #    4*) icon="" ;;
        #    *) icon="" ;;
        #esac
    fi

    echo "$battery% $icon "
else
    echo ""
fi
