#!/usr/bin/env bash
_shell=$(awk -F: -v user="$USER" '$1 == user {print $NF}' /etc/passwd)
[ "$_shell" != "$(which zsh)" ] && sudo chsh -s $(which zsh) "$USER"

mkdir -p $HOME/.local/{bin,share}
if [ -f "$HOME/bin/chezmoi" ]; then
	mv "$HOME/bin/chezmoi" "$HOME/.local/bin/"
	[ "$(ls -A "$HOME/bin")" ] || rm -r "$HOME/bin"
fi
