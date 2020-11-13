# Arch Linux Specific

alias open='xdg-open'

# make AUR packages with all processor cores
# https://wiki.archlinux.org/index.php/Makepkg#Parallel_compilation
export MAKEFLAGS="-j$(nproc)"

alias paru='nice paru --batchinstall --combinedupgrade --devel --upgrademenu --sudoloop'
alias yay='nice yay'

alias uff-cleanup-zoom='killall -9 zoom; rm -rf ~/.cache/zoom ~/.config/zoomus.conf ~/.zoom'
