#!/bin/sh
# eval "$(curl -fsLS git.hrlou.net/hrlou/dotfiles/-/raw/main/.assets/include.sh)"
eval "$(curl -fsLS https://raw.githubusercontent.com/hrlou/dotfiles/main/.assets/include.sh)"
export BINDIR="$HOME/.local/bin"

# Install Chezmoi
if [ -f "${BINDIR}/chezmoi" ]; then
        CZ="${BINDIR}/chezmoi"
elif command -v chezmoi >/dev/null; then
        _log_info "Chezmoi found"
        CZ="$(which chezmoi)"
else
        _log_info "Installing chezmoi"
        mkdir -p "$BINDIR"
        curl -fsLS get.chezmoi.io | sh
        CZ="$BINDIR/chezmoi"
fi

_log_debug "Testing connection..."
REMOTE="$(ssh git@git.hrlou.net >/dev/null 2>&1 && \
        printf "git@git.hrlou.net:hrlou/dotfiles.git" || \
        printf "https://git.hrlou.net/hrlou/dotfiles.git")"
_log_info "Using '$REMOTE'"
$CZ init $REMOTE
$CZ apply
SRC="$(${CZ} source-path)"
. "${SRC}/.assets/include.sh"
_log_info "Dotfiles are installed, please restart shell session"
