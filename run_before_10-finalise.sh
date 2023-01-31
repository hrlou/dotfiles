#!/usr/bin/env bash

# bin
echo "cleaning"
mkdir -p $HOME/.local/{bin,share}
if [ -f "$HOME/bin/chezmoi" ]; then
	mv "$HOME/bin/chezmoi" "$HOME/.local/bin/"
	[ "$(ls -A "$HOME/bin")" ] || rm -r "$HOME/bin"
fi
echo "succesfully installed"
echo "restarting shell"
exec zsh
