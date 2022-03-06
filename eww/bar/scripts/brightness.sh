#! /bin/sh

get() {
    xbacklight -get
}

sett() {
    percentage=$1
    percentage=$(echo $percentage | awk '{print int($1+0.5)}')
    xbacklight -set $percentage
}

case $1 in
  "get") get;;
  "set") sett $2;;
esac
