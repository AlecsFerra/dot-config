#!/bin/bash

surfraw "$(sr -elvi \
         | awk -F'-' '{print $1}' \
         | sed '/:/d' \
         | awk '{$1=$1};1' \
         | rofi -kb-row-select "Tab" -kb-row-tab "Control+space" -dmenu -i \
                -config "$HOME/.config/rofi/search/rofi-config" -p "Websearch ")" --browser=firefox
