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

cz_install() {
	$CZ init $REMOTE
	$CZ update
	$CZ init
	$CZ apply
}

# Setup
echo "Testing connection..."
REMOTE="$(ssh git@git.hrlou.net >/dev/null 2>&1 && \
	printf "git@git.hrlou.net:hrlou/dotfiles.git" || \
	printf "https://git.hrlou.net/hrlou/dotfiles.git")"
echo "Using '$REMOTE'"

cz_install
#while ! $CZ verify $HOME/.zsh/.zshrc; do
#	cz_install
#done

echo "Dotfiles are installed"
echo "Please restart shell session"
