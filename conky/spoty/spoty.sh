#!/bin/sh

main() {
  if ! pgrep -x spotify >/dev/null; then
    echo ""; exit
  fi

  domain="org.mpris.MediaPlayer2"

  meta=$(dbus-send --print-reply --dest=${domain}.spotify \
    /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:${domain}.Player string:Metadata)

  artist=$(echo "$meta" \
          | sed -nr '/xesam:artist"/,+2s/^ +string "(.*)"$/\1/p' \
          | tail -1  \
          | sed 's/\&/\\&/g' \
          | sed 's#\/#\\/#g')

  album=$(echo "$meta" \
         | sed -nr '/xesam:album"/,+2s/^ +variant +string "(.*)"$/\1/p' \
         | tail -1 \
         | sed 's/\&/\\&/g' \
         | sed 's#\/#\\/#g')

  title=$(echo "$meta" \
         | sed -nr '/xesam:title"/,+2s/^ +variant +string "(.*)"$/\1/p' \
         | tail -1 \
         | sed 's/\&/\\&/g' \
         | sed 's#\/#\\/#g')

  echo "Now playing: $artist - $title"

}

main "$@"
