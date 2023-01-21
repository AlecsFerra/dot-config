#! /bin/dash
# only if xorg is running
pidof xmonad-x86_64-linux || exit

. /home/alecs/.config/secrets

intern=eDP1
extern=HDMI1

# Required as it's run by udev
export DISPLAY=:0
export XAUTHORITY=/home/alecs/.Xauthority

if xrandr | grep "$extern disconnected"; then
    xrandr --output "$extern" --off
    xrandr --auto
else
    xrandr --auto
    xrandr --output "$intern" --off
fi

hsetroot -fill "$WALLPAPER"
