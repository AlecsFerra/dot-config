if [ ! -f "$HOME/.Xauthority" ]; then
  ln -s $HOME/.Xauthority /run/user/1000/Xauthority
fi

export ZDOTDIR=$HOME/.config/zsh
