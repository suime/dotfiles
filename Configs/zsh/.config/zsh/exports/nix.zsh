function nix_install() {
    nix-env -iA nixpkgs.$1
}
function nix_search() {
    nix --extra-experimental-features "nix-command flakes" search nixpkgs $1
}

alias nix="nix --extra-experimental-features nix-command --extra-experimental-features flakes"
alias ni="nix_install"
alias ns="nix_search"
