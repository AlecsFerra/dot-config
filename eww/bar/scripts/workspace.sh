#! /bin/bash

source "wsicons.sh"

make_button() {
    name=$1
    status=$2
    alias=$3
    number=$4

    if [[ $status = "*" ]]; then
         class="active"
    elif [[ "${occupied[*]}" == *"$number"* ]]; then
        class="occupied"
    else
        class="inactive"
    fi


    echo -n "
        (button :onclick \"wmctrl -s $number \"
                :class   \"$class\"
                \"$alias\")
    " | tr "\n" " "
}

parse_ws() {
    mapfile -t names    < <(wmctrl -d | cut -d " " -f 13)
    mapfile -t status   < <(wmctrl -d | cut -d " " -f 3)
    mapfile -t occupied < <(wmctrl -l | cut -d' ' -f3 | uniq)

    echo -n "
        (box :class      \"workspaces\"
             :orientation \"v\"
             :spacing     0
    " | tr "\n" " "
    for i in "${!names[@]}"; do
        make_button "${names[$i]}"  \
                    "${status[$i]}" \
                    "${ICONS[$i]}"  \
                    "$i"
    done
    echo ")"
}

parse_ws_wayland() {

    echo -n "
        (box :class      \"workspaces\"
             :orientation \"v\"
             :spacing     0
    " | tr "\n" " "
    for i in "${!names[@]}"; do
        make_button "${names[$i]}"  \
                    "${status[$i]}" \
                    "${ICONS[$i]}"  \
                    "$i"
    done
    echo ")"
}

xprop -spy -root _NET_CURRENT_DESKTOP _NET_ACTIVE_WINDOW _NET_CLIENT_LIST \
  | while read -r; do
  parse_ws
done

swaymsg -t SUBSCRIBE -m "['window', 'workspace']" \
  | while read -r; do
  parse_ws_wayland
done
