#! /bin/bash

TOGGLE_DIR="/tmp/dnd/"
TOGGLE_FILE="$TOGGLE_DIR/dnd_toggle_file"

icon() {
    get_icon() {
        if [ ! -e $TOGGLE_FILE ]; then
            echo ""
        else
            echo ""
        fi
    }

    mkdir -p "$TOGGLE_DIR"

    get_icon
    inotifywait -q -mr -e create,delete $TOGGLE_DIR | while read -r; do
        get_icon
    done
}

run() {
    ~/.config/scripts/dnd.sh
}

case $1 in
  "icon") icon;;
  "run")  run;;
esac
