#! /bin/bash

count() {
    if ! updates_arch=$(checkupdates 2> /dev/null | wc -l ); then
        updates_arch=0
    fi

    if ! updates_aur=$(paru -Qua 2> /dev/null | wc -l); then
        updates_aur=0
    fi

    n_updates=$(("$updates_arch" + "$updates_aur"))
    echo $n_updates
}

launch() {
  $TERMINAL -e "$SHELL" -ic topgrade -k
}

case $1 in
  "count")  count;;
  "launch") launch;;
esac
