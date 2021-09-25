# Arch Linux Specific
if [[ $OSTYPE = linux* ]]; then

alias open='xdg-open'

# make AUR packages with all processor cores
# https://wiki.archlinux.org/index.php/Makepkg#Parallel_compilation
export MAKEFLAGS="-j$(nproc)"

export MANPAGER=most

alias makepkg='nice makepkg'
alias paru='nice paru'
alias yay='nice yay'

alias uff-install-zoom='paru -S --needed --noconfirm zoom'
alias uff-cleanup-zoom='killall -9 zoom; rm -rf ~/.cache/zoom ~/.config/zoomus.conf ~/.zoom; doas pacman -R zoom'

alias hawvpn='doas openconnect -u abp507 --authgroup="Student*in" --background connect.haw-hamburg.de'
alias hawvpn-stop='doas killall openconnect'

fi
