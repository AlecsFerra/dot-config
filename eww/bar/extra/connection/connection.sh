#! /bin/bash

info() {
  type=$(nmcli -f type connection show --active \
        | sed -n 2p \
        | sed -e 's/\ *$//g' )
  case $type in
    *"wifi"*)  type="wifi";;
    *"wired"*) type="wired";;
    *)         type="disconnected";;
  esac

  name=$(nmcli -f name connection show --active \
        | sed -n 2p \
        | sed -e 's/\ *$//g' )

  printf '{
    "type": "%s",
    "name": "%s"
  }' "$type" "$name" | tr "\n" " "
  echo ""
}

launch() {
  $TERMINAL -e "$SHELL" -ic nmtui
}

case $1 in
  "info")   info;;
  "launch") launch;;
esac
