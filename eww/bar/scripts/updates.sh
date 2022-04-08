#! /bin/sh
no() {
    if ! updates_arch=$(checkupdates 2> /dev/null | wc -l ); then
        updates_arch=0
    fi

    if ! updates_aur=$(paru -Qua 2> /dev/null | wc -l); then
        updates_aur=0
    fi

    n_updates=$(("$updates_arch" + "$updates_aur"))
    echo $n_updates
}

icon() {
    n_updates=$(no)
    if [ "$n_updates" -gt "0" ]; then
        echo ""
    else
        echo ""
    fi
}

run() {
  $TERMINAL -e "$SHELL" -ic topgrade -k
}


case $1 in
  "icon") icon;;
  "no")   no;;
  "run")  run;;
esac
