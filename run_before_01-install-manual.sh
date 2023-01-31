#!/usr/bin/env bash
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
if ! command -v cargo >/dev/null; then
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi
if ! command -v starship >/dev/null; then
	curl --proto '=https' --tlsv1.2 -sSf https://starship.rs/install.sh | sudo sh
fi
