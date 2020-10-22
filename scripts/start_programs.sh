#!/bin/bash

# Monitor
"$HOME"/.config/scripts/monitor.sh &
sxhkd &

# Load Xresources
xrdb ~/.config/Xresources &

# Wallpaper and lockscreen
export wallpaper="$HOME"/Pictures/Wallpapers/leaf.jpg
betterlockscreen --update $wallpaper &
xss-lock -- "$HOME"/.config/scripts/lock.sh &
#feh --bg-fill $wallpaper &
hsetroot -fill $wallpaper #-tint "#2E3440" & # -contrast 0.80
wal --theme base16-nord &

conky -c $HOME/.config/conky/clock/conkyrc &
#conky -c $HOME/.config/conky/resources/conkyrc &
conky -c $HOME/.config/conky/spoty/conkyrc &
# glava --desktop &

# Auth manager
lxpolkit &

# Mouse pointer and keyboard
xsetroot -cursor_name left_ptr &
unclutter --timeout 1 &
$HOME/.config/scripts/keyboard.sh &
$HOME/.config/scripts/wacom.sh &

# Picom
picom &

# Applets
blueman-applet &
redshift-gtk &
flameshot &

# kde-bugget
/usr/lib/kdeconnectd &
indicator-kdeconnect &

# gestures
#libinput-gestures-setup start &

# Notifications
deadd-notification-center &
batsignal -b &

# Polybar and rice
"$HOME"/.config/polybar/start.sh &
"$HOME"/.config/xob/launch_volume_bar.sh &

