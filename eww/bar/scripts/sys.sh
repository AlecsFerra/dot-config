
case $1 in
  "restart")  reboot;;
  "shutdown") shutdown now;;
  "reboot")   reboot;;
  "lock")     lock.sh;;
  "quit")     killall xmonad;;
esac
