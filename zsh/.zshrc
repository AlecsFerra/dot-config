#XDG
source ~/.config/zsh/xdg_dirs.zsh

# ZSH config
# History
HISTFILE="$XDG_STATE_HOME/zsh/history"
SAVEHIST=10000
HISTSIZE=10000
setopt share_history inc_append_history extended_history

autoload -Uz compinit
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
export ZSH_AUTOSUGGEST_STRATEGY=(history)

source ~/.config/zsh/agnoster.zsh-theme
setopt prompt_subst
source ~/.config/zsh/plugins/git.zsh
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fpath+=(~/.config/zsh/plugins/zsh-completions/src/)
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
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
bindkey -v
export KEYTIMEOUT=1
export CLICOLOR=1

export VISUAL=nvim
export EDITOR="$VISUAL"
export TERMINAL="alacritty"

export QT_STYLE_OVERRIDE=kvantum

set XAUTHORITY=~/.Xauthority

alias sudo="sudo " #force alias expansion after sudo

alias ls="lsd --group-dirs first"
alias ll="lsd -l --group-dirs first"
alias lla="lsd -l --group-dirs first -all"
alias lt="lsd --group-dirs first --tree"
alias la="lsd --group-dirs first --all"

alias rm=trash-put
alias tmp="cd $(mktemp -d)"

# Dirs
alias cdc="cd $HOME/Repos/dot-config/"
alias cda="cd $HOME/Documents/Appunti/"
alias cdb="cd $HOME/Documents/Books/"

# X11
alias s="startx $HOME/.xinitrc"
export _JAVA_AWT_WM_NONREPARENTING=1

alias get_class="xprop | grep CLASS"

# Arch specific
alias reflector_up="reflector --country Italy \
                              --save /etc/pacman.d/mirrorlist 
                     echo 'Update done'"
alias unused_pkg="paru -Qdtq"
alias remove="paru -Rnsc"

alias :q="exit"
alias cpwd="  pwd \
            | xclip -selection clipboard
            echo 'Copied selection to clipboard!'"

alias vim=nvim
alias v=vim
alias r=ranger

# Opam
test -r /home/alecs/.local/share/opam/opam-init/init.zsh \
   && . /home/alecs/.local/share/opam/opam-init/init.zsh > /dev/null 2> /dev/null \
   || true

# Path vars
path+=("/home/alecs/.config/cargo/bin")
path+=("/home/alecs/.local/bin")
path+=("/home/alecs/.idris2/bin")
path+=("/home/alecs/.config/scripts")
export PATH
