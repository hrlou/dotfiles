#!/usr/bin/env bash
set -eu

export LC_ALL=C.UTF-8
export LANG=C.UTF-8
PACKAGES=''

# COMMANDS
command -v cmake >/dev/null || PACKAGES+="cmake "
command -v curl >/dev/null || PACKAGES+="curl "
command -v nvim >/dev/null || PACKAGES+="neovim "		
command -v vim >/dev/null || PACKAGES+="vim "		
command -v zsh >/dev/null || PACKAGES+="zsh "

# DEBIAN
if command -v apt >/dev/null; then
	echo "Running on debian based distribution"
	# install nala
	if ! command -v nala >/dev/null; then
        	echo "deb [arch=amd64,arm64,armhf] http://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list
        	wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg > /dev/null
        	sudo apt-get update
		sudo apt install -y nala-legacy
	fi
	command -v gcc >/dev/null || PACKAGES+="build-essential "
	[ ! -z "${PACKAGES}" ] && sudo nala install -y $PACKAGES
	sudo chsh -s $(which zsh) "$USER"
fi

unset PACKAGES
