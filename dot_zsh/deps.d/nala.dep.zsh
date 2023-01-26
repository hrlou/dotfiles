#!/usr/bin/env zsh

function deps::check::nala {
	return !$+commands[nala]
}

function deps::install::nala {
	[ ! $+commands[dpkg] ] && return 0	
	echo "deb [arch=amd64,arm64,armhf] http://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list
	wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg > /dev/null
	sudo apt update && sudo apt install nala-legacy
}

function deps::init::nala {
	return 0	
}
