export PATH=$HOME/bin:/usr/local/bin:$HOME/.cargo/bin:$PATH

# 설정 한방 
for dir in ~/dotfiles/Configs/zsh/exports ~/dotfiles/Configs/zsh/alias; do
  for file in "$dir"/*; do
    source "$file"
  done
done
unset dir
unset file

# Tuckr 
alias tk="tuckr"



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

# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# source ~/powerlevel10k/zsh-syntax-highlighting/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh
# source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(oh-my-posh init zsh --config ~/dotfiles/Configs/omp/dh_theme.toml)"

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust
    
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting

### End of Zinit's installer chunk
