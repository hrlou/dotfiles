#!/bin/sh
# Install Chezmoi
export BINDIR="$HOME/.local/bin"
mkdir -p "$BINDIR"
curl -fsLS get.chezmoi.io | sh
CZ="$BINDIR/chezmoi"

# Setup
ssh git@git.hrlou.net || printf "Host git.hrlou.net\n\tHostname git.hrlou.net\n\tUser git\n\tPort 2052\n" >> ~/.ssh/config
REMOTE="$(ssh git@git.hrlou.net && \
	printf "git@git.hrlou.net:hrlou/dotfiles.git" || \
	printf "https://git.hrlou.net/hrlou/dotfiles.git")"

$CZ init $REMOTE
$CZ init
$CZ update
$CZ apply

TIMER=10
while [ $TIMER -gt 0 ]; do
	printf "Exiting in %02d\r" $TIMER
	sleep 1
	TIMER=$(($TIMER - 1))
done
