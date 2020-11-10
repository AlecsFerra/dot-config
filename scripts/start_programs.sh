#!/bin/sh

# Monitor
"$HOME"/.config/scripts/monitor.sh &
sxhkd &

export wallpaper="$HOME/Pictures/Wallpapers/solar.jpg"
wal --theme pastel && "$HOME"/.config/polybar/start.sh & # Bullshit
betterlockscreen --update $wallpaper &
xss-lock -- "$HOME"/.config/scripts/lock.sh &
#feh --bg-fill $wallpaper &
hsetroot -cover $wallpaper #-tint "#2E3440" & # -contrast 0.80

# Rice stuff
"$HOME"/.config/xob/launch_volume_bar.sh &
conky -c $HOME/.config/conky/clock/conkyrc &
conky -c $HOME/.config/conky/spoty/conkyrc &
conky -c $HOME/.config/conky/tasks/conkyrc &
#conky -c $HOME/.config/conky/resources/conkyrc &
#glava --desktop &

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
rm/tmp/dnd_toggle_file 2>/dev/null
batsignal -b &

