#!/usr/bin/env bash
set -e

function link() {
    mkdir -p "$(dirname "$2")"
    # verbose relative symbolic force
    ln -vrsf "$1" "$2"
}

link "$(pwd)/alacritty.yml" "$HOME/.config/alacritty/alacritty.yml"
link "$(pwd)/dive.yaml" "$HOME/.config/dive/dive.yaml"
link "$(pwd)/htoprc" "$HOME/.config/htop/htoprc"
link "$(pwd)/paru.conf" "$HOME/.config/paru/paru.conf"
