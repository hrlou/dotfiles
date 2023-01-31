#!/usr/bin/env bash
_shell=$(awk -F: -v user="$USER" '$1 == user {print $NF}' /etc/passwd)
[ "$_shell" != "$(which zsh)" ] && sudo chsh -s $(which zsh) "$USER"
