#! /bin/bash

parse_ws_info() {
  mapfile -t names    < <(wmctrl -d | cut -d " " -f 13)
  mapfile -t status   < <(wmctrl -d | cut -d " " -f 3)
  mapfile -t occupied < <(wmctrl -l | cut -d' ' -f3 | uniq)

  echo -n "["
  is_fst=1
  for i in "${!names[@]}"; do
    if [[ $is_fst == 0 ]]; then
      echo -n ","
    fi

    if [[ "${status[$i]}" == *'*'* ]]; then
      is_active="true"
    else
      is_active="false"
    fi

    if [[ "${occupied[*]}" == *"$i"* ]]; then
      is_occupied="true"
    else
      is_occupied="false"
    fi

    icon="${ICONS[$i]}"

    printf '{
      "name":        "%s",
      "is_active":   %s,
      "number":      %s,
      "is_occupied": %s,
      "icon":        "%s"
    }' "${names[$i]}" "$is_active" "$i" "$is_occupied" "$icon" | tr "\n" " "

    is_fst=0
  done
  echo "]"
}

data() {
  xprop -spy -root _NET_CURRENT_DESKTOP _NET_ACTIVE_WINDOW _NET_CLIENT_LIST \
    | while read -r; do
    parse_ws_info
  done
}

focus() {
   wmctrl -s "$1"
}


case $1 in
  "data")  data;;
  "focus") focus "$2";;
esac
