export COLOR_INFO="\e[32m"
export COLOR_WARN="\e[33m"
export COLOR_ERROR="\e[31m"
export COLOR_DEBUG="\e[94m"
export LEVEL_INFO=0
export LEVEL_WARN=1
export LEVEL_ERROR=2
export LEVEL_DEBUG=3

_log() {
	LEVEL_STR="$1"
	MSG="$2"
	eval COLOR='$COLOR_'"$LEVEL_STR"
	>&2 printf "\e[2m[\e[0m`date "+%H:%M:%S"` ${COLOR}${LEVEL_STR}\e[0m\e[2m]\e[0m ${MSG}\n"
}

log_info() {
	_log "INFO" "$*"
}

log_warn() {
	_log "WARN" "$*"
}

log_error() {
	_log "ERROR" "$*"
}

log_debug() {
	_log "DEBUG" "$*"
}

cmd_check() {
	cmd="$1"
	if command -v "${cmd}" >/dev/null; then
		return 0
	else
		return 1
	fi
}
