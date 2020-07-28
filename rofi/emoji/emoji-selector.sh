#!/bin/bash

BASE_PATH="$HOME/.config/rofi/emoji"
EMOJIS_PATH="$BASE_PATH/emoji.xml"
EMOJIS_THEME="$BASE_PATH/emoji-config"

line=$(< "$EMOJIS_PATH" rofi -dmenu -config "$EMOJIS_THEME" -i -markup-rows -p "Search")

[[ -z $line ]] && exit

a="${line#*>}"

b="${a%<*}"

echo -n "$b" | xsel -ipb

xdotool key Ctrl+Shift+v
