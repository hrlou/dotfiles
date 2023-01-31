#!/usr/bin/env bash
if ! command -v starship >/dev/null; then
	curl --proto '=https' --tlsv1.2 -sSf https://starship.rs/install.sh | sudo sh
fi
