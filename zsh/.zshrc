#XDG
source ~/.config/zsh/xdg_dirs.zsh

# ZSH config
# History
HISTFILE="$XDG_STATE_HOME/zsh/history"
SAVEHIST=10000
HISTSIZE=10000
setopt share_history inc_append_history extended_history

autoload -Uz compinit
export ZSH_AUTOSUGGEST_STRATEGY=(history)

source ~/.config/zsh/agnoster.zsh-theme
setopt prompt_subst
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fpath+=(~/.config/zsh/plugins/zsh-completions/src/)
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh
source ~/.config/zsh/plugins/zsh-fzy/zsh-fzy.plugin.zsh

compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
source ~/.config/zsh/plugins/git.zsh
source ~/.config/zsh/plugins/dirs.zsh

setopt autocd
setopt extendedglob
setopt auto_menu
setopt complete_in_word
setopt always_to_end
setopt prompt_subst

# Completion
zstyle ':completion:*' menu select
zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zsh/zcompcache

# Vi mode
export KEYTIMEOUT=1
export CLICOLOR=1

export VISUAL=nvim
export EDITOR="$VISUAL"
export TERMINAL="alacritty"
export DIFFPROG="nvim -d"

export QT_STYLE_OVERRIDE=kvantum

set XAUTHORITY=~/.Xauthority

export _JAVA_AWT_WM_NONREPARENTING=1
export MOZ_X11_EGL=1

source ~/.config/zsh/alias.zsh

# Opam
test -r /home/alecs/.local/share/opam/opam-init/init.zsh \
   && . /home/alecs/.local/share/opam/opam-init/init.zsh > /dev/null 2> /dev/null \
   || true

# Path vars
path+=("/home/alecs/.config/cargo/bin")
path+=("/home/alecs/.local/bin")
path+=("/home/alecs/.idris2/bin")
path+=("/home/alecs/.config/scripts")
path+=("/home/alecs/Repos/dot-config/backup")
path+=($GOPATH)
export PATH
