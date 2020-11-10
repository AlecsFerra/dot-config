#! /bin/bash

device_id="4c4e68715f38a796"
device_name="Mi 9"

is_reach="$(qdbus org.kde.kdeconnect "/modules/kdeconnect/devices/$device_id" org.kde.kdeconnect.device.isReachable)"

if $is_reach; then
    battery="$(qdbus org.kde.kdeconnect "/modules/kdeconnect/devices/$device_id" org.kde.kdeconnect.device.battery.charge)"
    is_charging="$(qdbus org.kde.kdeconnect "/modules/kdeconnect/devices/$device_id" org.kde.kdeconnect.device.battery.isCharging)"
    if $is_charging; then
        case $battery in
            100) icon="" ;;
            9[0-9]) icon="" ;;
            8[0-9]|7[0-9]) icon="" ;;
            6[0-9]|5[0-9]) icon="" ;;
            4[0-9]|3[0-9]) icon="" ;;
            [0-9]) icon="" ;;
        esac
    else
        case $battery in
            100) icon="" ;;
            9[0-9]) icon="" ;;
            8[0-9]|7[0-9]) icon="" ;;
            6[0-9]|5[0-9]) icon="" ;;
            4[0-9]|3[0-9]) icon="" ;;
            [0-9]) icon="" ;;
        esac
    fi

    echo "$device_name $icon $battery%"
else
    echo ""
fi
