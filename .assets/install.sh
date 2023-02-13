#!/bin/sh
# Install Chezmoi
if command -v chezmoi >/dev/null; then
	echo "Chezmoi found"
	CZ="$(which chezmoi)"
else
	echo "Installing chezmoi"
	export BINDIR="$HOME/.local/bin"
	mkdir -p "$BINDIR"
	curl -fsLS get.chezmoi.io | sh
	CZ="$BINDIR/chezmoi"
fi

echo "Testing connection..."
REMOTE="$(ssh git@git.hrlou.net >/dev/null 2>&1 && \
	printf "git@git.hrlou.net:hrlou/dotfiles.git" || \
	printf "https://git.hrlou.net/hrlou/dotfiles.git")"
echo "Using '$REMOTE'"
$CZ init $REMOTE
$CZ update
$CZ init
$CZ apply
SRC="$(${CZ} source-path)"
. "${SRC}/.assets/include.sh"

_log "dotfiles are installed"
_log "please restart shell session"
