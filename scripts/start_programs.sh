#!/bin/bash

# Monitor
"$HOME"/.config/scripts/monitor.sh

# Load Xresources
xrdb ~/.config/Xresources &

# Load keybindings
sxhkd &

# Notifications
"$HOME"/.config/dunst/run_dunst.sh &
batsignal -b &

# Wallpaper and lockscreen
betterlockscreen --update "$HOME"/Pictures/Wallpapers/nord.jpg &
xss-lock -- "$HOME"/.config/scripts/lock.sh
feh --bg-scale "$HOME"/Pictures/Wallpapers/nord.jpg &
wal --theme base16-nord &

# Auth manager
lxpolkit &

# Mouse pointer and keyboard
xsetroot -cursor_name left_ptr &
unclutter --timeout 1 &
setxkbmap -option grp:alt_shift_toggle it,us &

# Polybar and rice
"$HOME"/.config/polybar/start.sh &
"$HOME"/.config/xob/launch_volume_bar.sh &

# Picom
picom &

# Applets
blueman-applet &
redshift &
redshift-gtk &
