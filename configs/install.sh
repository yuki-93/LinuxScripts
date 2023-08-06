#!/usr/bin/env bash
set -eu

function link() {
	mkdir -p "$(dirname "$2")"
	rm -rf "$2"
	if [[ $OSTYPE = darwin* ]]; then
		# verbose symbolic force
		ln -vsf "$1" "$2"
	else
		ln --verbose --relative --symbolic --force "$1" "$2"
	fi
}

# Bin files
for file in "$(pwd)"/bin/*; do
	filename=$(basename "$file")
	link "$file" "$HOME/bin/$filename"
done

# Git folders
mkdir -p ~/git/hub/EdJoPaTo/public

# Music Player Daemon
mkdir -p "$HOME/.cache/mpd/"
link "$(pwd)/mpd.conf" "$HOME/.config/mpd/mpd.conf"

# Neovim
link "$(pwd)/neovim/init.lua" "$HOME/.config/nvim/init.lua"
link "$(pwd)/neovim/lua" "$HOME/.config/nvim/lua"

# Linux only
if [[ $OSTYPE = linux* ]]; then
	link "$(pwd)/envvars.conf" "$HOME/.config/environment.d/envvars.conf"
	link "$(pwd)/fuzzel.ini" "$HOME/.config/fuzzel/fuzzel.ini"
	link "$(pwd)/hyprland.conf" "$HOME/.config/hypr/hyprland.conf"
	link "$(pwd)/i3status-rust.toml" "$HOME/.config/i3status-rust/config.toml"
	link "$(pwd)/kanshi" "$HOME/.config/kanshi/config"
	link "$(pwd)/paru.conf" "$HOME/.config/paru/paru.conf"
	link "$(pwd)/rofi" "$HOME/.config/rofi"
	link "$(pwd)/sway" "$HOME/.config/sway/config"
	link "$(pwd)/swaylock" "$HOME/.config/swaylock/config"
	link "$(pwd)/waybar" "$HOME/.config/waybar"
fi

# Zsh
mkdir -p "$HOME/.cache/"
mkdir -p "$HOME/.config/completions/"
link "$(pwd)/zsh/zshrc" "$HOME/.zshrc"
for file in "$(pwd)"/zsh/*.zsh; do
	filename=$(basename "$file")
	link "$file" "$HOME/.config/zsh/$filename"
done

link "$(pwd)/.editorconfig" "$HOME/.editorconfig"
link "$(pwd)/.tokeignore" "$HOME/.tokeignore"
link "$(pwd)/alacritty.yml" "$HOME/.config/alacritty/alacritty.yml"
link "$(pwd)/config.fish" "$HOME/.config/fish/config.fish"
link "$(pwd)/dive.yaml" "$HOME/.config/dive/dive.yaml"
link "$(pwd)/gitconfig" "$HOME/.config/git/config"
link "$(pwd)/global.gitignore" "$HOME/.config/git/global.gitignore"
link "$(pwd)/helix" "$HOME/.config/helix"
link "$(pwd)/htoprc" "$HOME/.config/htop/htoprc"
link "$(pwd)/starship.toml" "$HOME/.config/starship.toml"
link "$(pwd)/tmux.conf" "$HOME/.config/tmux/tmux.conf"

rm -f "$HOME/.gitconfig"

if [[ $OSTYPE = darwin* ]]; then
	link "$(pwd)/vscode-settings.json" "$HOME/Library/Application Support/VSCodium/User/settings.json"
else
	link "$(pwd)/vscode-settings.json" "$HOME/.config/Code - OSS/User/settings.json"
fi
