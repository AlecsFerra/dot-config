#! /bin/bash

bwmenu \
  -c 10 \
  --auto-lock 300 \
  -- -config "$HOME/.config/rofi/bw/theme.rasi" \
  -dmenu \
  -no-fixed-num-lines
