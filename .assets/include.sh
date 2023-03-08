#!/bin/sh
COLOR_INFO="\e[32m"
COLOR_WARN="\e[33m"
COLOR_ERROR="\e[31m"
COLOR_DEBUG="\e[94m"
LEVEL_INFO=0
LEVEL_WARN=1
LEVEL_ERROR=2
LEVEL_DEBUG=3

_log() {
	local LEVEL_STR="$1"
	local MSG="$2"
	eval COLOR='$COLOR_'"$LEVEL_STR"
	>&2 printf "\e[2m[\e[0m`date "+%H:%M:%S"` ${COLOR}${LEVEL_STR}\e[0m\e[2m]\e[0m ${MSG}\n"
}

log_info() {
	_log "INFO" "$*"
}

log_warn() {
	_log "WARN" "$*"
}

log_err() {
	_log "ERROR" "$*"
}

log_debug() {
	_log "DEBUG" "$*"
}

cmd_check() {
	local cmd="$1"
	return $(command -v $cmd >/dev/null)
}
