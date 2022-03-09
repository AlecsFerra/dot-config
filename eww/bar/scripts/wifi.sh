#! /bin/sh

icon() {
  get_icon() {
    type=$(nmcli -f type connection show --active | sed -n 2p)
    if [[ "$type" = *"wifi"* ]]; then
      echo ""
    elif [[ "$type" = *"wired"* ]]; then
      echo ""
    else
      echo ""
    fi
  }

  get_icon
  nmcli m | while read; do
    get_icon
  done
}

name() {
  get_name() {
    nmcli -f name connection show --active \
          | sed -n 2p
  }

  get_name
  nmcli m | while read; do
    get_name
  done
}

case $1 in
  "icon") icon;;
  "name") name;;
esac
