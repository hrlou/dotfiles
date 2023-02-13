COLOR_ERROR="\e[31m"
COLOR_WARN="\e[33m"
COLOR_LOG="\e[32m"
COLOR_INFO="\e[94m"
END="\e[0m"

__log() {
	>&2 echo -e "dotfiles: $*"
}

_log() {
	__log "${COLOR_LOG}$*${END}" 
}

_log_warn() {
	__log "${COLOR_WARN}$*${END}" 
}

_log_err() {
	__log "${COLOR_ERROR}$*${END}" 
}

_log_info() {
	__log "${COLOR_INFO}$*${END}" 
}

_cmd_check() {
	local cmd="$1"
	return $(command -v $cmd >/dev/null)
}
