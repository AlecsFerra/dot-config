#! /bin/bash

bat=/sys/class/power_supply/BAT0/

icon() {
    if [ $(cat "$bat/status") = "Charging" ] ||
       [ $(cat "$bat/status") = "Full" ]; then
        per="$(percent)"
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

mode-icon() {
  mode=$(powerprofilesctl get)
  case $mode in
    "power-saver") echo "";;
    "balanced")    echo "";;
    "performance") echo "";;
  esac
}

timeleft() {
  if [[ $(acpi -b) = *"Full, 100%"* ]]; then
    echo "Already full"
  else
    acpi -b | cut -d, -f3 | cut -d' ' -f2
  fi
  # charge_now=$(cat $bat/charge_now)
  # current_now=$(cat $bat/current_now)
  # sec_left=$(( $charge_now / $current_now ))
  # date -d@"$sec_left" -u +%H:%M:%S
}

status() {
  cat "$bat/status"
}

mode() {
  powerprofilesctl get
}

set-mode() {
  powerprofilesctl set $1
}

percent() {
    cat "$bat/capacity"
}

case $1 in
  "icon")       icon;;
  "percent")    percent;;
  "mode-icon")  mode-icon;;
  "timeleft")   timeleft;;
  "status")     status;;
  "mode")       mode;;
  "set-mode")   set-mode $2;;
esac
