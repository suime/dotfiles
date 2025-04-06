# exports 
set fish_greeting ""
set -gx TERM xterm-256color
set -gx PATH ~/.local/bin:~/.nix-profile/bin/:/usr/local/bin:$HOME/.cargo/bin $PATH
set -gx LC_ALL "C"

switch (uname)
    case Darwin
        echo "mac"
        abbr -a py --position anywhere "python3"
    case Linux
        echo "nas"
        abbr -a py --position anywhere "python"
    case '*'
        echo "fish window"
end


# alias 
alias ep "$EDITOR ~/.config/fish/config.fish"
alias re "fish"
alias c "clear"
alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."
alias ..... "cd ../../../.."
alias cdd "cd $HOME/Downloads"

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

# fzf 
set FZF_DEFAULT_OPTS " \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"
set FZF_CTRL_T_OPTS "\
--walker-skip .git,node_modules,target
--preview 'bat -n --color=always {}'
--bind 'ctrl-/:change-preview-window(down|hidden|)'"
# CTRL-Y to copy the command into clipboard using pbcopy
set FZF_CTRL_R_OPTS "
--bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
--color header:italic
--header 'Press CTRL-Y to copy command into clipboard'"
# Print tree structure in the preview window
set FZF_ALT_C_OPTS "
--walker-skip .git,node_modules,target
--preview 'eza -T --level=1 --icons=always {} | head -200'"

# git 
abbr -a g "git"
abbr -a lg "lazygit"

# nix 
function nix_install
    nix-env -iA nixpkgs.$argv[1]
end

function nix_search
    nix --extra-experimental-features "nix-command flakes" search nixpkgs $argv[1]
end

abbr -a nix "nix --extra-experimental-features nix-command --extra-experimental-features flakes"
abbr -a ni "nix_install"
abbr -a ns "nix_search"

# conda 
abbr -a co "conda"
abbr -a cel "conda env list"

# tuckr 
set TUCKR_HOME "$HOME"
set TUCKR_TARGET "$HOME"
abbr -a tk "tuckr"

# python
set PYTHONIOENCODING 'UTF-8';


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
