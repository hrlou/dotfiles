#!/usr/bin/env zsh
# vim: ft=zsh

# SUPER #
(( $+commands[su] )) && SUPER="su - -c"
(( $+commands[sudo] )) && SUPER="sudo"
(( $+commands[doas] )) && SUPER="doas"
export SUPER="$(which "$SUPER")"
[[ "$OSTYPE" == linux-android ]] && unset SUPER
# SUPER #

# PKG #
if (( $+commands[dpkg] )); then
	PKG="dpkg"
	(( $+commands[apt] )) && PKG="apt"
	(( $+commands[apt-get] )) && PKG="apt-get"
	(( $+commands[nala] )) && PKG="nala"
elif (( $+commands[rpm] )); then
	PKG="rpm"
	(( $+commands[yum] )) && PKG="yum" 
	(( $+commands[dnf] )) && PKG="dnf"
	(( $+commands[zypper] )) && PKG="zypper"
fi

export PKG="$(which "$PKG")"
# PKG #
