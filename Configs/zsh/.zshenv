if [ -e "$HOME/.cargo/env" ]; then . "$HOME/.cargo/env"; fi 

if [ -e /var/services/homes/qkqxk500/.nix-profile/etc/profile.d/nix.sh ]; then . /var/services/homes/qkqxk500/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

if [ -f ~/.zshrc ]; then
    source ~/.zshrc
fi
