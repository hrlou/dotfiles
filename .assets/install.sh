#!/bin/sh
export BINDIR="$HOME/.local/bin"
if [ -f "${BINDIR}/chezmoi" ]; then
        CZ="${BINDIR}/chezmoi"
elif command -v chezmoi >/dev/null; then
        _log_info "Chezmoi found"
        CZ="$(which chezmoi)"
else
        _log_info "Installing chezmoi"
        mkdir -p "$BINDIR"
        sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $BINDIR
	CZ="$BINDIR/chezmoi"
fi
read -p "Do you wish to use SSH? (y/N) " yn
case $yn in
	y | yes ) REMOTE="git@github.com:hrlou/dotfiles.git";;
	* ) REMOTE="https://github.com/hrlou/dotfiles.git";;
esac
echo "Using '${REMOTE}'"
$CZ init $REMOTE
$CZ apply
echo "Dotfiles are installed, please restart shell session"
