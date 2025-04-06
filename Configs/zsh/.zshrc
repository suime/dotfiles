export PATH=/usr/local/bin:$HOME/.cargo/bin:~/.local/bin:/opt/homebrew/bin:$PATH

# 설정 한방 
for dir in ~/.config/zsh/{alias,exports,functions}; do
  for file in "$dir"/*; do
    source "$file"
  done
done
unset dir
unset file


#^ 별칭
alias ep="cursor ~/.zshrc"
alias re="source ~/.zshrc"
alias cls="clear"

alias python="/usr/bin/python3"
alias pip="/usr/bin/pip3"
alias p="pokefetch"

# wifi 
wifi() {
  local INTERFACE=EN0
  local MAC=$1

  sudo ifconfig en0 ether $MAC
}
alias wifiex="wifi F8:C3:CC:2A:53:B8"

eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/dh_theme.toml)"

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
# autoload -Uz _zinit
# (( ${+_comps} )) && _comps[zinit]=_zinit

# (this is currently required for annexes)
zinit for \
  light-mode \
    junegunn/fzf \
    Aloxaf/fzf-tab \
    ajeetdsouza/zoxide \
    zsh-users/zsh-autosuggestions \
    unixorn/fzf-zsh-plugin \
    zdharma-continuum/fast-syntax-highlighting 
    # zsh-users/zsh-syntax-highlighting \

# source ~/.config/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# fzf --style full \
#     --preview 'fzf-preview.sh {}' --bind 'focus:transform-header:file --brief {}'

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --icons=always -w=60 --group-directories-first $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza --icons=always -w=60 $realpath'
source <(fzf --zsh)

### End of Zinit's installer chunk
# pokefetch 

# Added by Windsurf
export PATH="/Users/daehyeon/.codeium/windsurf/bin:$PATH"
