#!/usr/bin/env zsh
# vim: ft=zsh

# SUPER #
(( $+commands[su] )) && SUPER="su - -c"
(( $+commands[sudo] )) && SUPER="sudo"
(( $+commands[doas] )) && SUPER="doas"
export SUPER=$(sh -c "which $SUPER")
[[ "$OSTYPE" == linux-android ]] && unset SUPER
[[ $UID == 0 ]] && unset SUPER
# SUPER #

# PKG #
if (( $+commands[apt] )); then
	PKG="apt"
	(( $+commands[apt] )) && PKG="apt"
	(( $+commands[apt-get] )) && PKG="apt-get"
	(( $+commands[nala] )) && PKG="nala"
elif (( $+commands[rpm] )); then
	PKG="rpm"
	(( $+commands[yum] )) && PKG="yum" 
	(( $+commands[dnf] )) && PKG="dnf"
	(( $+commands[zypper] )) && PKG="zypper"
elif (( $+commands[pacman] )); then
	PKG="pacman"
fi
export PKG="$(which "$PKG")"
# PKG #
