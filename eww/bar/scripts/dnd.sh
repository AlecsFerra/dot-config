#! /bin/bash

TOGGLE_FILE="/tmp/dnd_toggle_file"

icon() {
    if [ ! -e $TOGGLE_FILE ]; then
        echo ""
    else
        echo ""
    fi
}

run() {
    ~/.config/scripts/dnd.sh
}

case $1 in
  "icon") icon;;
  "run")  run;;
esac
