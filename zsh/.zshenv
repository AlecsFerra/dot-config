if [ ! -f "$HOME/.Xauthority" ]; then
  ln -s $HOME/.Xauthority /run/user/1000/Xauthority
fi

export ZDOTDIR=$HOME/.config/zsh

#if [ "$(tty)" = '/dev/tty1' ]; then
#    [ -z "$DISPLAY$SSH_TTY$(pgrep xinit)" ] && $HOME/.config/scripts/start_session
#fi
