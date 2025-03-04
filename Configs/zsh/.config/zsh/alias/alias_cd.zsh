#!/usr/bin/env zsh
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias -- -="cd -"
alias cdd="cd $HOME/Downloads"
function mkcd() {
    mkdir $1
    cd $1
}
