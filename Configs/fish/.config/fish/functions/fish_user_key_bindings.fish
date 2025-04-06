function fish_user_key_bindings
  # fzf
  bind \cf fzf_change_directory

  # clear
  bind \cl clear

  # delete word
  bind \cH backward-kill-word

  # delete backward
  bind \cD kill-word

end

# fzf plugin
fzf_configure_bindings --directory=\co