#!/usr/bin/env zsh

function deps::check::rust {
	[[ ! -v CARGO_HOME ]] && export CARGO_HOME="$HOME/.cargo"
	[ -d "$CARGO_HOME" ] && return 0 || return 1
}

function deps::install::rust {
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}

function deps::init::rust {
	[ -f "$CARGO_HOME/env" ] && source "$CARGO_HOME/env"
}
