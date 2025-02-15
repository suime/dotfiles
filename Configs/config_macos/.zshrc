if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$HOME/bin:/usr/local/bin:$HOME/.cargo/bin:$PATH

# Tuckr 
export TUCKR_HOME="/Users/daehyeon/"
export TUCKR_TARGET="/Users/daehyeon/"
alias tk="tuckr"

export YAZI_CONFIG_HOME="~/dotfiles/Configs/.config/yazi"


export ZSH="$HOME/.oh-my-zsh"

HIST_STAMPS="yy-mm-dd"

source $ZSH/oh-my-zsh.sh

plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
    fzf
)

source ~/powerlevel10k/powerlevel10k.zsh-theme

#^ 별칭
alias ep="cursor ~/.zshrc"
alias python="/usr/bin/python3"
alias pip="/usr/bin/pip3"
alias cls="clear"
alias vi= "cursor"

alias ls='colorls'
# 이동
alias cdd="cd ~/Downloads"
alias cdv="cd /Volumes/"

# alias cdc="cd ~/download"

# 프로젝트 바로가기용
alias py="/Users/daehyeon/Python/"
alias js="/Users/daehyeon/JS/"

# 프로파일 새로고침
alias re="source ~/.zshrc"



# 회사 와이파이용 맥 주소 변경
ip2ex(){
  sudo ifconfig en0 ether F8:C3:CC:2A:53:B8
}

ip2normal(){
  # sudo ifconfig en0 down
  sudo ifconfig en0 ether da:20:05:45:9d:c7
  # sudo ifconfig en0 ether 96:41:A2:75:91:03
  # sudo ifconfig en0 up
}

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/powerlevel10k/zsh-syntax-highlighting/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
