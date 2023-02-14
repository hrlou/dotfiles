#!/bin/sh
# Bootstrap
eval "$(curl -fsLS git.hrlou.net/hrlou/dotfiles/-/raw/main/.assets/include.sh)"
export BINDIR="$HOME/.local/bin"
# Install Chezmoi
if [ -f "${BINDIR}/chezmoi" ]; then
        CZ="${BINDIR}/chezmoi"
elif command -v chezmoi >/dev/null; then
        _log_info "chezmoi found"
        CZ="$(which chezmoi)"
else
        _log_info "installing chezmoi"
        mkdir -p "$BINDIR"
        curl -fsLS get.chezmoi.io | sh
        CZ="$BINDIR/chezmoi"
fi
_log_debug "testing connection..."
REMOTE="$(ssh git@git.hrlou.net >/dev/null 2>&1 && \
        printf "git@git.hrlou.net:hrlou/dotfiles.git" || \
        printf "https://git.hrlou.net/hrlou/dotfiles.git")"
_log_info "using '$REMOTE'"
$CZ init $REMOTE
$CZ apply
SRC="$(${CZ} source-path)"
. "${SRC}/.assets/include.sh"
_log_info "dotfiles are installed"
_log_info "please restart shell session"
