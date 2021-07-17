#! /bin/dash

last_mute=""
last_level=""

handle_event() {
  current_mute=$(pamixer --get-mute)
  current_level=$(pamixer --get-volume)

  if [ "$last_level" != "$current_level" ] || [ "$last_mute" != "$current_mute" ]; then

    echo -n $current_level
    if [ "$current_mute" = "true" ]; then
      echo -n "!"
    fi
    echo ""

    last_level=$current_level
    last_mute=$current_mute
  fi
}

pactl subscribe \
  | grep --line-buffered "sink" \
  | while read -r line; do handle_event; done
