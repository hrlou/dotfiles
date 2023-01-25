#!/usr/bin/env zsh
function deps {
	[ -z "$1" ] && echo "unkown operation" && return
	
	if ! (($DEPS[(Ie)$2])); then
	 	echo "no such dependency"
		return
	fi
	if [[ "$1" == "init" ]]; then
		if $(eval "deps::check::$2"); then
			eval "deps::init::$2"
		else
			eval "deps::install::$2"
		fi
	else
		eval "deps::$1::$2"
	fi
}

# load dep files
function deps::load {
	for i in $DEPS; do
		source "$ZDOTDIR/deps.d/$i.dep.zsh"
	done
	unset i
}

# clean unnecessary functions
function deps::clean {
	for i in $DEPS; do
		unset -f deps::{check,install,init}::$i
	done
	unset i
}


deps::load
for i in $DEPS_ENABLED; do
	deps init $i
done
unset i
deps::clean
