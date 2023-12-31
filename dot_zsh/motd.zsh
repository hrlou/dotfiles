#!/usr/bin/env zsh

[ -f /etc/os-release ] && source /etc/os-release || PRETTY_NAME="Terminal"
ZSH_NAME="$(zsh --version | sed 's/ (.*//g')"
KERNEL_VERSION="$(uname -r)"

# LOGO
if [[ "${NAME}" == "Arch Linux" ]]; then 	
	LOGO="󰣇"
elif [[ "${NAME}" == "Debian GNU/Linux" ]]; then
	LOGO=""
else
	LOGO=""
fi
emod="  "

printf "${emod}${ZSH_NAME}\n"
printf "${LOGO}${emod}${PRETTY_NAME}\n"
printf "${emod}Linux [${KERNEL_VERSION}]\n"

