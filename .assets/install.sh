#!/bin/sh
# Install Chezmoi
export BINDIR="$HOME/.local/bin"
mkdir -p "$BINDIR"
curl -fsLS get.chezmoi.io | sh
CZ="$BINDIR/chezmoi"

# Setup
ssh git@git.hrlou.net 2>/dev/null || printf "Host git.hrlou.net\n\tHostname git.hrlou.net\n\tUser git\n\tPort 2052\n" >> $HOME/.ssh/config
REMOTE="$(ssh git@git.hrlou.net 2>/dev/null && \
	printf "git@git.hrlou.net:hrlou/dotfiles.git" || \
	printf "https://git.hrlou.net/hrlou/dotfiles.git")"

$CZ git remote add origin "$REMOTE"
$CZ init
#$CZ init $REMOTE
$CZ update
$CZ apply

echo "Dotfiles are installed"
echo "Please restart shell session"
