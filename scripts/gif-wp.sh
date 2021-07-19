#! /bin/dash

wallpaper=$1

intern=eDP-1
extern=HDMI-1

idim="$(xrandr --query | grep "$intern connected" | grep -o '[0-9][0-9]*x[0-9][0-9]*[^ ]*' | sed -r 's/^[^0-9]*([0-9]+x[0-9]+).*$/\1/')"
echo $idim

edim="$(xrandr --query | grep "$extern connected" | grep -o '[0-9][0-9]*x[0-9][0-9]*[^ ]*' | sed -r 's/^[^0-9]*([0-9]+x[0-9]+).*$/\1/')"
echo $idim

xwinwrap -g $idim -fdt -d -- mpv -wid WID --loop=inf "$wallpaper"

if xrandr | grep "$extern connected"; then
    wi=${idim%x*}
    echo wi
	xwinwrap -g "$edim+$wi" -fdt -d -- mpv -wid WID --loop=inf "$wallpaper"
fi
