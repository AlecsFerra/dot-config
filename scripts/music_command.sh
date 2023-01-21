#! /bin/dash

echoerr() {
  echo "$1" >&2
}

if pgrep -x "spotify" 1>/dev/null; then
  domain="org.mpris.MediaPlayer2.spotify"
elif pgrep -x "nuclear" 1>/dev/null; then
  domain="org.mpris.MediaPlayer2.nuclear"
else
  echoerr "No music client running"
  domain="org.mpris.MediaPlayer2.spotify"
  LD_PRELOAD=/usr/lib/spotify-adblock.so spotify
fi

run_command() {
  dbus-send --print-reply \
            --dest="$domain" \
            /org/mpris/MediaPlayer2 $1
}

playpause() {
  command="org.mpris.MediaPlayer2.Player.PlayPause"
  run_command "$command" 1>/dev/null
}

previus() {
  command="org.mpris.MediaPlayer2.Player.Previous"
  run_command "$command" 1>/dev/null
}

next() {
  command="org.mpris.MediaPlayer2.Player.Next"
  run_command "$command" 1>/dev/null
}

uri() {
  echo "Not implemented" 1>&2
  exit 12
  # command="org.freedesktop.MediaPlayer2.OpenUri uri:'$1'"
  # run_command $command 1>/dev/null
}

info() {
  command="org.freedesktop.DBus.Properties.Get \
          string:org.mpris.MediaPlayer2.Player \
          string:Metadata"
  out=$(run_command "$command")
  artist=$(echo "$out" \
        | sed -nr '/xesam:artist"/,+2s/^ +string "(.*)"$/\1/p' \
        | tail -1)
  album=$(echo "$out" \
        | sed -nr '/xesam:album"/,+2s/^ +variant +string "(.*)"$/\1/p')
  title=$(echo "$out" \
        | sed -nr '/xesam:title"/,+2s/^ +variant +string "(.*)"$/\1/p')
  lenght=$(echo "$out" \
        | sed -nr '/mpris:length"/,+2s/^ +variant +uint64 (.*)$/\1/p')
  coverart=$(echo "$out" \
          | sed -nr '/mpris:artUrl"/,+2s/^ +variant +string "(.*)"$/\1/p')

  command="org.freedesktop.DBus.Properties.Get \
          string:org.mpris.MediaPlayer2.Player \
          string:Position"
  out=$(run_command "$command")
  position=$(echo "$out" \
          | tail -1 \
          | sed -E "s|.*variant.*int64 (.*)|\1|")

  command="org.freedesktop.DBus.Properties.Get \
          string:org.mpris.MediaPlayer2.Player \
          string:PlaybackStatus"
  out=$(run_command "$command")
  playbackStatus=$(echo "$out" \
                | tail -1 \
                | sed -E "s|.*variant.*string \"(.*)\"|\1|")

  command="org.freedesktop.DBus.Properties.Get \
          string:org.mpris.MediaPlayer2.Player \
          string:LoopStatus"
  out=$(run_command "$command")
  loopStatus=$(echo "$out" \
             | tail -1 \
             | sed -E "s|.*variant.*string \"(.*)\"|\1|")

  command="org.freedesktop.DBus.Properties.Get \
          string:org.mpris.MediaPlayer2.Player \
          string:Shuffle"
  out=$(run_command "$command")
  shuffle=$(echo "$out" \
         | tail -1 \
         | sed -E "s|.*variant.*boolean (.*)|\1|")

  printf '{
    "title": "%s",
    "album": "%s",
    "artist": "%s",
    "length": %s,
    "position": %s,
    "coverArt": "%s",
    "playbackStatus": "%s",
    "loopStatus": "%s",
    "shuffle": %s
  }' "$title" "$album" "$artist" "$lenght" "$position" "$coverart" \
     "$playbackStatus" "$loopStatus" "$shuffle" \
  | jq -Mc
}

usage() {
  echoerr "Usage:\tmusic_command.sh playpause"
  echoerr "\tmusic_command.sh previus"
  echoerr "\tmusic_command.sh next"
  echoerr "\tmusic_command.sh uri uri/to/song"
  echoerr "\tmusic_command.sh info"
  exit 1
}

case $1 in
  playpause) playpause;;
  previus)   previus;;
  next)      next;;
  uri)       [ -z "$2" ] && usage || uri "$2";;
  info)      info;;
  *)         usage;;
esac
