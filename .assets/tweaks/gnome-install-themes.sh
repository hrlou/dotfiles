#!/usr/bin/env bash
CACHE="${HOME}/.local/cache/hrlou"
COLLOID="Colloid-icon-theme"

working_tree="$(chezmoi data | jq .chezmoi.workingTree)"; working_tree="${working_tree:1:-1}"	
source "${working_tree}/.assets/include.sh"
log_warn "Most likely will not execute without dotfiles installed!"
log_info "This script is based off of the current configuration I am using, It is apt to change"

[ -d "${CACHE}" ] && rm -rf "${CACHE}"
log_info "Cloning '${COLLOID}' to cache"
mkdir -p "${CACHE}"
git clone "https://github.com/hrlou/Colloid-icon-theme" "${CACHE}/${COLLOID}"
sudo "${CACHE}/${COLLOID}/install.sh"
log_info "Done!"
