#! /bin/sh

get() {
    pamixer --get-volume
}

icon() {
    get_icon() {
      mute=$(pamixer --get-mute)
      if [[ $mute = "false" ]]; then
          echo ""
      else
          echo ""
      fi
    }

    get_icon
    pactl subscribe \
          | grep --line-buffered "sink" \
          | while read -r line; do
        get_icon
    done

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
