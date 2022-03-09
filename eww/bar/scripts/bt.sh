#! /bin/sh
icon() {
  get_icon() {
      status=$(bt-adapter --info | grep Powered | cut -d ' ' -f4)
      if [[ $status = "1" ]]; then
          echo ""
      else
          echo ""
      fi
  }
  get_icon
}


case $1 in
  "icon") icon;;
esac
