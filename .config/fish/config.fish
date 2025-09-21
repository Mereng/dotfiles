if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -g fish_greeting

alias dotfiles='git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
set -x EDITOR nvim
set -x GOPATH $HOME/.go
set -x PATH $PATH $GOPATH/bin 

starship init fish | source
zoxide init fish | source
