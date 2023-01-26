#!/usr/bin/env zsh

function deps::check::starship {
	return !$+commands[starship]
}

function deps::install::starship {
	curl -sS https://starship.rs/install.sh | sh
}

function deps::init::starship {
	eval "$(starship init zsh)"
}
