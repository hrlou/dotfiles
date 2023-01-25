#!/usr/bin/env zsh

function deps::check::rust {
	if [[ ! -v CARGO_HOME ]]; then
		export CARGO_HOME="$HOME/.cargo"
	fi
	if [[ -d "$CARGO_HOME" ]]; then
		return true
	fi
	return false
}

function deps::install::rust {
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	deps::init::rust
}

function deps::init::rust {
	source "$HOME/.cargo/env"
}
