scrot "$HOME/Pictures/Screenshots/%b%d-%H-%M-%S.png" \
      -q 100 \
      -e "notify-send --hint=string:x-dunst-stack-tag:scrot -i \$f \"screenshot saved\" \"Saved in \$f\" && xclip -sel clip -t image/png \$f"

