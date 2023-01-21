#!/bin/sh

if ! pgrep -x "nuclear|spotify" >/dev/null; then
  echo ""; exit
fi
  
meta=$(music_command.sh info)

artist=$(echo "$meta" | jq -r .artist | sed -s 's/artist: //')
title=$(echo "$meta" | jq -r .title | sed -s 's/title: //')

echo "Now playing: $artist - $title"
