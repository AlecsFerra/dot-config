#!/bin/bash

tdrop -m -A \
      -x 55 -y 5 -w 1850 \
      --wm xmonad \
      --name "float-alacritty" \
      alacritty --class "floating-terminal"
