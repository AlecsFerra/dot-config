#!/bin/bash

domain="org.mpris.MediaPlayer2"

case $1 in
    playpause)
        pgrep spotify 1>/dev/null || spotify
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
    *)
        echo "Invalid command $1"
        exit -1
        ;;
esac

dbus-send --print-reply\
          --dest=${domain}.spotify \
          /org/mpris/MediaPlayer2 \
          $command
