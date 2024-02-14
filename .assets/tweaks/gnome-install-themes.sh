#!/usr/bin/env bash
working_tree="$(chezmoi data | jq .chezmoi.workingTree)"; working_tree="${working_tree:1:-1}"	
source "${working_tree}/.assets/include.sh"

THEMES="/usr/share/themes"
ICONS="/usr/share/icons"
CACHE="${HOME}/.local/cache/hrlou"
COLLOID="Colloid-icon-theme"

install_colloid() {
	log_info "Cloning '${COLLOID}' to cache"
	mkdir -p "${CACHE}"
	git clone "https://github.com/hrlou/Colloid-icon-theme" "${CACHE}/${COLLOID}"
	sudo "${CACHE}/${COLLOID}/install.sh"
	gsettings set org.gnome.desktop.interface icon-theme 'Colloid'
	log_info "Colloid configured!"
}

install_catppuccin() {
	paru -S --needed catppuccin-gtk-theme-mocha
	theme='Catppuccin-Mocha-Standard-Lavender-Dark'
	gsettings set org.gnome.desktop.interface gtk-theme "${theme}"
	gsettings set org.gnome.shell.extensions.user-theme name "${theme}"
	linkadwaita "${THEMES}/${theme}"
	log_info "Catppuccin configured! Please relog"
}

# MAIN

log_warn "Most likely will not execute without dotfiles installed!"
log_info "This script is based off of the current configuration I am using, It is apt to change"

[ -d "${CACHE}" ] && rm -rf "${CACHE}"

if [ -d "${ICONS}/Colloid" ]; then
	log_info "Colloid detected"
	if yes_or_no "Re-install Colloid theme?"; then
		install_colloid
	fi
else
	log_info "Colloid not found"
	install_colloid
fi

if yes_or_no "Install and setup Catppuccin theme?"; then
	install_catppuccin
fi

log_info "Done!"
