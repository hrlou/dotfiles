#!/usr/bin/env zsh

function deps::check::starship {
	if (( $+commands[starship] )); then
		return true
	fi
	return false
}

function deps::install::starship {
	cargo install starship --locked
	deps::init::starship
}

function deps::init::starship {
	eval "$(starship init zsh)"
}
