#!/bin/sh
COLOR_INFO="\e[32m"
COLOR_WARN="\e[33m"
COLOR_ERROR="\e[31m"
COLOR_DEBUG="\e[94m"
LEVEL_INFO=0
LEVEL_WARN=1
LEVEL_ERROR=2
LEVEL_DEBUG=3

BOLD=$(tput bold)
END="\e[0m"

_log() {
	local LEVEL_STR="$1"; local MSG="$2"
	eval COLOR='$COLOR_'"$LEVEL_STR"
	>&2 printf "[`date "+%H:%M:%S"` ${BOLD}${COLOR}${LEVEL_STR}${END}] ${MSG}\n"
}

_log_info() {
	_log "INFO" "$*"
}

_log_warn() {
	_log "WARN" "$*"
}

_log_err() {
	_log "ERROR" "$*"
}

_log_debug() {
	_log "DEBUG" "$*"
}

_cmd_check() {
	local cmd="$1"
	return $(command -v $cmd >/dev/null)
}
