#!/usr/bin/env bash
if ! command -v starship >/dev/null; then
	curl -sS https://starship.rs/install.sh | sudo sh -s -- -y >/dev/null
fi
