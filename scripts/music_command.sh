#!/bin/dash

# The player is always (not really) the 1st PID, dumb hack
pid=$(pgrep "freezer" | head -1)
domain="org.mpris.MediaPlayer2.chromium.instance${pid}"

case $1 in
  playpause)
    pgrep freezer 1>/dev/null || freezer
    command=org.mpris.MediaPlayer2.Player.PlayPause
    ;;
  previus)
    command=org.mpris.MediaPlayer2.Player.Previous
    ;;
  next)
    command=org.mpris.MediaPlayer2.Player.Next
    ;;
  uri)
    command="org.freedesktop.MediaPlayer2.OpenUri $2"
    ;;
  trackinfo)
    command="org.freedesktop.DBus.Properties.Get \
            string:org.mpris.MediaPlayer2.Player \
            string:Metadata"
    ;;
  *)
    echo "Invalid command $1"
    exit 1
    ;;
esac

out=$(dbus-send --print-reply\
                --dest=${domain} \
                /org/mpris/MediaPlayer2 $command)

case $1 in
  trackinfo)
    # metadata should be decoded
    artist=$(echo "$out" \
          | sed -nr '/xesam:artist"/,+2s/^ +string "(.*)"$/\1/p' \
          | tail -1  \
          | sed 's/\&/\\&/g' \
          | sed 's#\/#\\/#g')
    album=$(echo "$out" \
         | sed -nr '/xesam:album"/,+2s/^ +variant +string "(.*)"$/\1/p' \
         | tail -1 \
         | sed 's/\&/\\&/g' \
         | sed 's#\/#\\/#g')
    title=$(echo "$out" \
         | sed -nr '/xesam:title"/,+2s/^ +variant +string "(.*)"$/\1/p' \
         | tail -1 \
         | sed 's/\&/\\&/g' \
         | sed 's#\/#\\/#g')
    echo "title: ${title}"
    echo "album: ${album}"
    echo "artist: ${artist}"
    ;;
  *)
    echo $out
    ;;
esac
