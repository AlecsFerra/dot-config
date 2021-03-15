#!/bin/dash

. "$HOME"/.config/secrets

# Monitor
"$HOME"/.config/scripts/monitor.sh &
sxhkd &

wal --theme blossom && "$HOME"/.config/polybar/start.sh & # Bullshit
betterlockscreen --update "$WALLPAPER" &
xss-lock -- "$HOME"/.config/scripts/lock.sh &

# Rice stuff
"$HOME"/.config/xob/launch_volume_bar.sh &
#conky -c "$HOME"/.config/conky/clock/conkyrc &
conky -c "$HOME"/.config/conky/spoty/conkyrc &
conky -c "$HOME"/.config/conky/tasks/conkyrc &
conky -c "$HOME"/.config/conky/resources/conkyrc &
#glava --desktop &

# Auth manager
lxpolkit &

# Mouse pointer and keyboard
xsetroot -cursor_name left_ptr &
unclutter --timeout 1 &
"$HOME"/.config/scripts/keyboard.sh &
"$HOME"/.config/scripts/wacom.sh &

# Picom
picom &

# Applets
blueman-applet &
flameshot &

# kde-bugget
/usr/lib/kdeconnectd &
indicator-kdeconnect &

# gestures
#libinput-gestures-setup start &

# Notifications
deadd-notification-center &
rm /tmp/dnd_toggle_file 2>/dev/null
batsignal -b &

## PROGRAMS ##
telegram-desktop &
element-desktop &
