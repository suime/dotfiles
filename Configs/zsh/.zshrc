export PATH=/usr/local/bin:$HOME/.cargo/bin:~/.local/bin:~/.nix-profile/bin:$PATH

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

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/dh_theme.toml)"

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
zinit for \
  light-mode \
    junegunn/fzf \
    Aloxaf/fzf-tab \
    zsh-users/zsh-autosuggestions \
    zdharma-continuum/fast-syntax-highlighting \
    ajeetdsouza/zoxide 
    # zdharma-continuum/zinit-annex-as-monitor \
    # zdharma-continuum/zinit-annex-bin-gem-node \
    # zdharma-continuum/zinit-annex-patch-dl \
    # zdharma-continuum/zinit-annex-rust \


zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --icons=always -w=60 --group-directories-first $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza --icons=always -w=60 $realpath'
### End of Zinit's installer chunk
