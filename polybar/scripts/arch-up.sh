#!/bin/sh
old_up=$(cat "$HOME/.cache/arch-up-script/old")
if ! updates_arch=$(checkupdates 2> /dev/null | wc -l ); then
    updates_arch=0
fi

if ! updates_aur=$(paru -Qua 2> /dev/null | wc -l); then
    updates_aur=0
fi

n_updates=$(("$updates_arch" + "$updates_aur"))
echo " $n_updates   "

if [ $n_updates -ne "$old_up" ]; then
    echo $n_updates > "$HOME/.cache/arch-up-script/old"
    if [ $n_updates -gt 0 ]; then
        notify-send.py -a pacman " 📦 Updates" " $n_updates ready to install" \
                       -i system-software-update
    fi
fi
