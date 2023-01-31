#!/usr/bin/env bash

mkdir -p $HOME/.local/{bin,share}
if [ -f "$HOME/bin/chezmoi" ]; then
	mv "$HOME/bin/chezmoi" "$HOME/.local/bin/"
	[ "$(ls -A "$HOME/bin")" ] || rm -r "$HOME/bin"
fi
