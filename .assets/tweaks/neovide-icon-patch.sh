#!/usr/bin/env bash
working_tree="$(chezmoi data | jq .chezmoi.workingTree)"; working_tree="${working_tree:1:-1}"	
source "${working_tree}/.assets/include.sh"

APPLICATIONS="/usr/share/applications"

if [ ! -f "${APPLICATIONS}/neovide.desktop" ]; then
	log_error "Cannot stat '${APPLICATIONS}/neovide.desktop'"
	exit 1
fi

log_info "Changing icon"
sudo sed -i 's/Icon=neovide/Icon=nvim/' "${APPLICATIONS}/neovide.desktop"
log_info "Updating desktop database"
sudo update-desktop-database
log_info "Done!"
