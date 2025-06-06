# exports
set fish_greeting ""
set -gx TERM xterm-256color
#set -gx PATH ~/.local/bin:~/.nix-profile/bin/:/usr/local/bin:$HOME/.cargo/bin $PATH
#set -gx LC_ALL C
set -U fish_user_paths v/usr/local/bin /Users/daehyeon/.local/bin /System/Cryptexes/App/usr/bin /usr/bin /bin /usr/sbin /sbin /var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin /var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin /var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin /Library/Apple/usr/bin /Applications/VMware Fusion.app/Contents/Public /usr/local/go/bin /Applications/quarto/bin /Users/daehyeon/.codeium/windsurf/bin /Users/daehyeon/.cargo/bin /opt/homebrew/bin /Library/Frameworks/Python.framework/Versions/3.13/bin /Users/daehyeon/.local/share/zinit/polaris/bin /Applications/iTerm.app/Contents/Resources/utilities /Users/daehyeon/.local/share/zinit/plugins/unixorn---fzf-zsh-plugin/bin /Users/daehyeon/.fzf/bin
set -gx EDITOR nvim
set -gx LANG ko_KR.UTF-8
set -gx LC_ALL ko_KR.UTF-8

# alias  abbr
bind \e kill-whole-line
alias ep "$EDITOR ~/.config/fish/config.fish"
abbr -a es "$EDITOR ~/.ssh/config"
abbr -a eb $EDITOR ~/.config/fish/functions/fish_user_key_bindings.fish
alias et "$EDITOR ~/.config/tmux/tmux.conf"
alias ey "$EDITOR ~/.config/yazi/yazi.toml"
alias ez "$EDITOR ~/.config/zellij/config.kdl"
alias re "source ~/.config/fish/config.fish"
alias ㅊ clear
alias c clear
alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."
alias ..... "cd ../../../.."
alias cdd "cd $HOME/Downloads"
abbr -a fc --position anywhere "~/.config/fish/config.fish"
abbr -a ㅛ yazi
abbr -a ip ifconfig
abbr -a cls clear
abbr -a cnt --position anywhere count
abbr -a br brew

# cargo
abbr -a ca cargo

# eza
set -gx EZA_CONFIG_HOME ~/.config/eza
alias ls "eza --icons=always --hyperlink --group-directories-first -w=80 --ignore-glob=@eaDir"
alias ll "eza -l --icons=always --hyperlink -a -h --no-user --ignore-glob=@eaDir \
--time-style='+%Y.%m.%d %H:%M' --group-directories-first --color-scale=all --color-scale-mode=gradient"
alias ld "eza -l --icons=always --hyperlink -a -D -h --no-permissions --no-user --ignore-glob=@eaDir --time-style='+%Y.%m.%d %H:%M'"
alias lf "eza -l --icons=always --hyperlink -a -f -h --no-permissions --no-user --time-style='+%Y.%m.%d %H:%M'"
alias lt "eza -T --icons=always --hyperlink --level=2"

# functions
function mkcd
    mkdir $argv[1]
    cd $argv[1]
end

fzf --fish | source

set -gx FZF_DEFAULT_OPTS " \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#f5475a \
--multi"
set -gx FZF_CTRL_T_OPTS " \
--walker-skip .git,node_modules,target \
--preview 'bat -n --color=always {}' \
--bind 'ctrl-/:change-preview-window(down|hidden|)'"
# Print tree structure in the preview window
set -gx FZF_ALT_C_OPTS " \
--walker-skip .git,node_modules,target \
--preview 'eza -T --icons=always --level=2 {} | head -200'"

# git
abbr -a g git
abbr -a lg lazygit
abbr -a 햣 git
abbr -a ㅊㅇ cd
abbr -a 니 ls
abbr -a ins --position anywhere install
abbr -a gc ghq get

# nix
function nix_install
    nix-env -iA nixpkgs.$argv[1]
end

function nix_search
    nix --extra-experimental-features "nix-command flakes" search nixpkgs $argv[1]
end

abbr -a nix "nix --extra-experimental-features nix-command --extra-experimental-features flakes"
abbr -a ni nix_install
abbr -a ns nix_search

# conda
abbr -a co conda
abbr -a cel "conda env list"

# ssh
alias ssha "ssh dh_nas -t /var/services/homes/qkqxk500/.nix-profile/bin/fish "
# tmux
abbr -a t tmux
alias tmux "tmux -u"
abbr -a ta "tmux a"
abbr -a tk "tmux kill-server"
abbr -a tl "tmux ls"

# tldr
alias tldr "tldr --compact"
abbr -a tt tldr

# tuckr
set TUCKR_HOME "$HOME"
set TUCKR_TARGET "$HOME"

# python
set PYTHONIOENCODING UTF-8
abbr -a py python
# >>> yazi
set YAZI_CONFIG_HOME "~/.config/yazi"
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# >>> zellij
abbr -a za "zellij a"
abbr -a zz zellij

# wifi
function wifi -d "맥주소 변경"
    set -l mac $argv[1]
    sudo ifconfig en0 ether $mac
end
alias wifiex "wifi F8:C3:CC:2A:53:B8"
alias wifino "wifi 66:5F:13:40:37:7A"
alias wifi1 "wifi ac:c9:06:08:31:ec"
function chat -d "claude chat"
    set -l ask $argv[1]
    set -l json (printf '{"id": "qkqxk500", "input": "%s"}' "$ask")
    set -l res (curl -s -X POST "http://59.24.191.180:5004/end" \
        -H "Content-Type: application/json" \
        -d $json)
    echo $res
end
