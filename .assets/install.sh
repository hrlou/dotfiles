#!/bin/sh
# Install Chezmoi
export BINDIR="$HOME/.local/bin"
mkdir -p "$BINDIR"
curl -fsLS get.chezmoi.io | sh
CZ="$BINDIR/chezmoi"

cz_install() {
	$CZ init $REMOTE
	$CZ update
	$CZ init
	$CZ apply
}

# Setup
ssh git@git.hrlou.net 2>/dev/null || printf "Host git.hrlou.net\n\tHostname git.hrlou.net\n\tUser git\n\tPort 2052\n" >> $HOME/.ssh/config
REMOTE="$(ssh git@git.hrlou.net 2>/dev/null && \
	printf "git@git.hrlou.net:hrlou/dotfiles.git" || \
	printf "https://git.hrlou.net/hrlou/dotfiles.git")"

while ! $CZ verify $HOME/.zsh/.zshrc; do
	cz_install
done

echo "Dotfiles are installed"
echo "Please restart shell session"
