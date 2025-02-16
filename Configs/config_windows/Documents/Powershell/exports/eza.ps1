# eza 링크 
$Env:EZA_CONFIG_DIR="$HOME/.config/eza"


function ls {
    eza --icons=always --hyperlink --group-directories-first -w=80 --ignore-glob=@eaDir
}

function ll {
    eza -l --icons=always --hyperlink -a -h --no-permissions --no-user --ignore-glob=@eaDir --time-style='+%Y.%m.%d %H:%M' --color-scale=size --color-scale-mode=gradient
}

function lf {
    eza -l --icons=always --hyperlink -a -f -h --no-permissions --no-user --ignore-glob=@eaDir --time-style='+%Y.%m.%d %H:%M' --color-scale=size --color-scale-mode=gradient
}

function ld {
    eza -l --icons=always --hyperlink -a -D -h --no-permissions --no-user --ignore-glob=@eaDir --time-style='+%Y.%m.%d %H:%M' --color-scale=size --color-scale-mode=gradient
}