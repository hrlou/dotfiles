#!/usr/bin/env zsh

function deps::check::starship {
	return !$+commands[starship]
}

function deps::install::starship {
	cargo install starship --locked
}

function deps::init::starship {
	eval "$(starship init zsh)"
}
