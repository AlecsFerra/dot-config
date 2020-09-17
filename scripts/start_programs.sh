#!/bin/bash

# Monitor
"$HOME"/.config/scripts/monitor.sh &
sxhkd &

# Load Xresources
xrdb ~/.config/Xresources &

# Notifications
# "$HOME"/.config/dunst/run_dunst.sh &
deadd-notification-center &
batsignal -b &

# Wallpaper and lockscreen
wallpaper="$HOME"/Pictures/Wallpapers/darkmnt.jpg
betterlockscreen --update $wallpaper &
xss-lock -- "$HOME"/.config/scripts/lock.sh &
feh --bg-fill $wallpaper &
wal --theme blossom &

conky -c $HOME/.config/conky/clock/conkyrc &
conky -c $HOME/.config/conky/resources/conkyrc &
conky -c $HOME/.config/conky/spoty/conkyrc &
# glava --desktop &

# Auth manager
lxpolkit &

# Mouse pointer and keyboard
xsetroot -cursor_name left_ptr &
unclutter --timeout 1 &
$HOME/.config/scripts/keyboard.sh &
$HOME/.config/scripts/wacom.sh &

# Polybar and rice
"$HOME"/.config/polybar/start.sh &
"$HOME"/.config/xob/launch_volume_bar.sh &

# Picom
picom &

# Applets
blueman-applet &
redshift &
redshift-gtk &
flameshot &

# kde-bugget
/usr/lib/kdeconnectd &
indicator-kdeconnect &
