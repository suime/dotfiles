# clear
bind \cl clear
bind \cH backward-kill-word

# delete backward
bind \cD kill-word

bind \e\[3\;5~ kill-word

bind \e kill-whole-line

# fzf 
bind \cp _fzf_search_processes

# search repo 
bind \cg __ghq_repository_search

# fzf plugin
fzf_configure_bindings --directory=\co

#todo 
# os 버전마다 단춬키 다르게 작동하게 하기 
