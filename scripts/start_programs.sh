#! /bin/dash

. "$HOME"/.config/secrets

# Monitor
"$HOME"/.config/scripts/monitor.sh &
sxhkd &

wal --theme base16-onedark &
betterlockscreen --update "$WALLPAPER" &
xss-lock -- "$HOME"/.config/scripts/lock.sh &

eww open statusbar

# Rice stuff
"$HOME"/.config/xob/launch.sh &
conky -c "$HOME"/.config/conky/clock/conkyrc &
conky -c "$HOME"/.config/conky/spoty/conkyrc &

pywalfox start -p &

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
flameshot &

# kde-bugget
/usr/lib/kdeconnectd &
indicator-kdeconnect &

espanso start --unmanaged &

# Notifications
deadd-notification-center &
batsignal -b &

## PROGRAMS ##
telegram-desktop &
#librewolf &
# qbittorrent-nox &
calcurse --daemon &
sleep 10 && $HOME/.config/eww/bar/tray.sh &
