#! /bin/sh

icon() {
  type=$(nmcli -f type connection show --active | sed -n 2p)
  if [[ "$type" = *"wifi"* ]]; then
    echo ""
  elif [[ "$type" = *"wired"* ]]; then
    echo ""
  else
    echo ""
  fi

}

name() {
  nmcli -f name connection show --active \
        | sed -n 2p
}

case $1 in
  "icon") icon;;
  "name") name;;
esac
