#! /bin/bash

bat=/sys/class/power_supply/BAT0/

setmode() {
  case $1 in
    "performance") sudo tlp ac;;
    "saving")      sudo tlp bat;;
    "auto")        sudo tlp start;;
  esac
}

timeleft() {
  if [[ $(acpi -b) = *"Full, 100%"* ]]; then
    echo "Already full"
  else
    acpi -b | cut -d, -f3 | cut -d' ' -f2
  fi
}

mode() {
  if tlp-stat -s | grep -q 'Mode.*=.*AC' ; then
    echo "performance"
  else
    echo "power-saver"
  fi
}

info() {
  timeleft=$(timeleft)
  status=$(cat "$bat/status")
  mode=$(mode)
  temperature=$(acpi -t | cut --delimiter=" " -f4)

  printf '{
    "timeleft":    "%s",
    "status":      "%s",
    "mode":        "%s",
    "temperature": "%s"
  }' "$timeleft" "$status" "$mode" "$temperature" | tr "\n" " "
  echo ""
}

case $1 in
  "setmode") setmode $2;;
  "info")    info;;
esac
