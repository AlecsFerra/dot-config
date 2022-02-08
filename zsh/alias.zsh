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

alias cp="rsync -avz --progress"

alias rm=trash-put
alias tmp="cd $(mktemp -d)"

#Termbin
alias tb="nc termbin.com 9999"

# Dirs
alias cdc="cd $HOME/Repos/dot-config/"
alias cda="cd $HOME/Documents/Appunti/"
alias cdb="cd $HOME/Documents/Books/"

# X11
alias s="startx $HOME/.xinitrc 1>$HOME/.cache/x.log 2>&1"

alias cpy="xclip -i -sel clip"

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
alias r=ranger

alias scheme=scheme48
alias kc="kdeconnect-cli -d 18670d10550d4c33"
