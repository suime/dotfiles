# eza
# export EZA_CONFIG_HOME= '~/.config/eza'
alias ls="eza --icons=always --hyperlink --group-directories-first -w=80 --ignore-glob=@eaDir"
alias ll="eza -l --icons=always --hyperlink -a -h --no-permissions --no-user --ignore-glob=@eaDir \
--time-style='+%Y.%m.%d %H:%M' --group-directories-first --color-scale=all --color-scale-mode=gradient"
alias ld="eza -l --icons=always --hyperlink -a -D -h --no-permissions --no-user --ignore-glob=@eaDir --time-style='+%Y.%m.%d %H:%M'"
alias lf="eza -l --icons=always --hyperlink -a -f -h --no-permissions --no-user --time-style='+%Y.%m.%d %H:%M'"
alias lt="eza -T --icons=always --hyperlink --level=2"
