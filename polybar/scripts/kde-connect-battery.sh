#! /bin/bash

device_id="bc589360833d3c73"
device_name="Mi 9"

is_reach="$(qdbus org.kde.kdeconnect "/modules/kdeconnect/devices/$device_id" org.kde.kdeconnect.device.isReachable)"

if $is_reach; then
    battery="$(qdbus org.kde.kdeconnect "/modules/kdeconnect/devices/$device_id" org.kde.kdeconnect.device.battery.charge)"
    is_charging="$(qdbus org.kde.kdeconnect "/modules/kdeconnect/devices/$device_id" org.kde.kdeconnect.device.battery.isCharging)"
    if $is_charging; then
        case $battery in
            100) icon="" ;;
            9*) icon="" ;;
            8*|7*) icon="" ;;
            6*|5*) icon="" ;;
            4*|3*) icon="" ;;
            *) icon="" ;;
        esac
    else
        case $battery in
            100) icon="" ;;
            9*) icon="" ;;
            8*|7*) icon="" ;;
            6*|5*) icon="" ;;
            4*|3*) icon="" ;;
            *) icon="" ;;
        esac
    fi

    echo "$icon  $device_name $battery%"
else
    echo ""
fi
