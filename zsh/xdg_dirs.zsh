eval "$(antidot init)" # Cleanup home

export XDG_STATE_HOME=$HOME/.local/state

export PYTHONSTARTUP="$HOME/.config/pythonrc.py"
export OCTAVE_HISTFILE="$XDG_CACHE_HOME/octave-hsts"
export OCTAVE_SITE_INITFILE="$XDG_CONFIG_HOME/octave/octaverc"
export ANDROID_HOME="$XDG_DATA_HOME"/android
export GDBHISTFILE="$XDG_CONFIG_HOME"/gdb/.gdb_history
export GHCUP_USE_XDG_DIRS=true
export IPYTHONDIR="${XDG_CONFIG_HOME}/ipython"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export KDEHOME="$XDG_CONFIG_HOME"/kde
export WINEPREFIX="$XDG_DATA_HOME"/wine

alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
