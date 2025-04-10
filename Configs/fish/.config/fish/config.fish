# exports 
set fish_greeting ""
set -gx TERM xterm-256color
set -gx PATH ~/.local/bin:~/.nix-profile/bin/:/usr/local/bin:$HOME/.cargo/bin $PATH
set -gx LC_ALL C
set -gx EDITOR nvim
set -gx LANG ko_KR.UTF-8
set -gx LC_ALL ko_KR.UTF-8

switch (uname)
    case Darwin
        echo mac
        abbr -a py --position anywhere python3
    case Linux
        echo nas
        abbr -a py --position anywhere python
    case '*'
        echo "fish window"
end

# alias  abbr 
alias ep "$EDITOR ~/.config/fish/config.fish"
alias re fish
alias c clear
alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."
alias ..... "cd ../../../.."
alias cdd "cd $HOME/Downloads"

abbr -a ip ifconfig
abbr -a cls clear
abbr -a cnt --position anywhere count

# eza 
alias ls "eza --icons=always --hyperlink --group-directories-first -w=80 --ignore-glob=@eaDir"
alias ll "eza -l --icons=always --hyperlink -a -h --no-permissions --no-user --ignore-glob=@eaDir \
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

# tmux 
abbr -a tm tmux
alias tmux "tmux -u"
alias ta "tmux a"

# tuckr 
set TUCKR_HOME "$HOME"
set TUCKR_TARGET "$HOME"
abbr -a tk tuckr

# python
set PYTHONIOENCODING UTF-8

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

# >>> yt-dlp 
