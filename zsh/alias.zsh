alias sudo="sudo " #force alias expansion after sudo

alias ls="lsd --group-dirs first"
alias ll="lsd -l --group-dirs first"
alias lla="lsd -l --group-dirs first -all"
alias lt="lsd --group-dirs first --tree"
alias la="lsd --group-dirs first --all"

alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

alias mkdir="mkdir -p"

#alias cp="rsync -avz --progress"
function _cp() {
  cp "$@" &
  progress -mp $!
}
alias cp="_cp"

function _mv() {
  mv "$@" &
  progress -mp $!
}
alias mv="_mv"

alias rm=trash-put
alias tmp="cd $(mktemp -d)"

function ex() {
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

rangercd () {
    tmp="$(mktemp)"
    ranger --choosedir="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}

#Termbin
alias tb="nc termbin.com 9999"

# Dirs
alias cdc="cd $HOME/Repos/dot-config/"
alias cda="cd $HOME/Documents/Appunti/"
alias cdb="cd $HOME/Documents/Books/"

# X11
alias s="startx $HOME/.xinitrc 1>$HOME/.cache/x.log 2>&1"

alias cpy="xclip -selection clipboard"

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

alias v=$EDITOR
alias sv=sudoedit
alias r=rangercd
alias img="nsxiv -a"
alias z=zathura

alias scheme=scheme48
alias kc="kdeconnect-cli -d 18670d10550d4c33"

bindkey -v
bindkey -s '^o' 'r\n'

autoload -z edit-command-line
zle -N edit-command-line
bindkey '^r' edit-command-line

bindkey '^f' fzy-history-widget
