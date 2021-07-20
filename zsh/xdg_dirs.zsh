eval "$(antidot init)" # Cleanup home

XDG_STATE_HOME=$HOME/.local/state

export PYTHONSTARTUP="$HOME/.config/pythonrc.py"

export OCTAVE_HISTFILE="$XDG_CACHE_HOME/octave-hsts"
export OCTAVE_SITE_INITFILE="$XDG_CONFIG_HOME/octave/octaverc"

