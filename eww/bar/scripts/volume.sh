#! /bin/sh

get() {
   pamixer --get-volume 
}

icon() {
    mute=$(pamixer --get-mute)
    if [[ $mute = "false" ]]; then
        echo ""
    else
        echo ""
    fi
}

mute() {
  pamixer -t
}

sett() {
    percentage=$1
    pamixer --set-volume $percentage
}

case $1 in
  "get")  get;;
  "icon") icon;;
  "mute") mute;;
  "set")  sett $2;;
esac
