function fish_user_key_bindings
  # clear
  bind \cl clear

  # delete word
  bind \cH backward-kill-word

  # delete backward
  bind \cD kill-word

  bind \e\[3\;5~ kill-word

  bind \e kill-whole-line

  # fzf 
  bind \cp _fzf_search_processes

end

# fzf plugin
fzf_configure_bindings --directory=\co