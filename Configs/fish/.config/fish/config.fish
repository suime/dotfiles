if status is-interactive
    # Commands to run in interactive sessions can go here
end

# exports 
set fish_greeting ""
set -gx TERM xterm-256color
set -gx PATH ~/.local/bin:~/.nix-profile/bin/ $PATH
set -gx LC_ALL "C"
# alias 
alias ep "$EDITOR ~/.config/fish/config.fish"
alias re "fish"
alias c "clear"
alias .. "cd ../"

# eza 
alias ls "eza --icons=always --hyperlink --group-directories-first -w=80 --ignore-glob=@eaDir"
alias ll "eza -l --icons=always --hyperlink -a -h --no-permissions --no-user --ignore-glob=@eaDir \
--time-style='+%Y.%m.%d %H:%M' --group-directories-first --color-scale=all --color-scale-mode=gradient"
alias ld "eza -l --icons=always --hyperlink -a -D -h --no-permissions --no-user --ignore-glob=@eaDir --time-style='+%Y.%m.%d %H:%M'"
alias lf "eza -l --icons=always --hyperlink -a -f -h --no-permissions --no-user --time-style='+%Y.%m.%d %H:%M'"
alias lt "eza -T --icons=always --hyperlink --level=2"

# nix 
function nix_install
    nix-env -iA nixpkgs.$argv[1]
end

function nix_search
    nix --extra-experimental-features "nix-command flakes" search nixpkgs $argv[1]
end

abbr --add nix "nix --extra-experimental-features nix-command --extra-experimental-features flakes"
abbr --add ni "nix_install"
abbr --add ns "nix_search"

# conda 
abbr --add co "conda"
abbr --add cel "conda env list"

# tuckr 

set TUCKR_HOME "$HOME"
set TUCKR_TARGET "$HOME"

abbr --add tk "tuckr"

# >>> yazi 
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end