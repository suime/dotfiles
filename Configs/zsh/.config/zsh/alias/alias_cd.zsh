#!/usr/bin/env zsh

# Easier navigation: .., ..., ...., ....., ~ and -
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
