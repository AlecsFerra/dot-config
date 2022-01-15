#! /bin/dash

rofi -show combi \
     -combi-modi "window,drun" \
     -modi "combi,run,ssh" \
     -config "$HOME/.config/rofi/launcher/theme.rasi" \
     -no-fixed-num-lines
