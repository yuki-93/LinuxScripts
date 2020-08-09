# Arch Linux Specific

alias open='xdg-open'

# make AUR packages with all processor cores
# https://wiki.archlinux.org/index.php/Makepkg#Parallel_compilation
export MAKEFLAGS="-j$(nproc)"

alias yay='nice yay'

alias setup-ros-melodic='source /opt/ros/melodic/setup.zsh'
alias setup-ros-noetic='source /opt/ros/noetic/setup.zsh'
alias setup-ros='setup-ros-melodic'
