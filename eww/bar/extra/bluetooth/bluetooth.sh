#! /bin/bash

info() {
  status=$(bt-adapter --info | grep Powered | cut -d ' ' -f4)
    if [ "$status" = "1" ]; then
        echo "true"
    else
        echo "false"
    fi
}

case $1 in
  "info") info;;
esac
