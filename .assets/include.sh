C_RED="\e[31m"
C_GREEN="\e[32m"
C_LBLUE="\e[94m"
C_END="\e[0m"

__log() {
	>&2 echo -e "dotfiles: $*"
}

_log() {
	__log "${C_GREEN}$*${C_END}" 
}

_log_err() {
	__log "${C_RED}$*${C_END}" 
}

_log_info() {
	__log "${C_LBLUE}$*${C_END}" 
}

_cmd_check() {
	local cmd="$1"
	return $(command -v $cmd >/dev/null)
}
