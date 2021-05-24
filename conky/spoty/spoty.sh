#!/bin/sh

if ! pgrep -x freezer >/dev/null; then
  echo ""; exit
fi
  
meta=$(music_command.sh trackinfo)

artist=$(echo "$meta" | grep "artist: " | sed -s 's/artist: //')
title=$(echo "$meta" | grep "title: " | sed -s 's/title: //')

echo "Now playing: $artist - $title"
