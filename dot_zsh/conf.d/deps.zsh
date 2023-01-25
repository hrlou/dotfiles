#!/usr/bin/env zsh
# mutated depsending on os or whatever

function deps::source {
	for i in $DEPS; do
		source "$ZDOTDIR/depss.d/$i.deps.zsh"
	done
	unset i
}

function deps::clean {
	for i in $DEPS; do
		unset -f deps::{check,install,init}::$i
	done
	unset i
	unset DEPS
}

function deps {
	deps::source
	if ! (($DEPS[(Ie)$2])); then
	 	echo "no such depsendency"
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
	deps::clean
}

deps::source

for i in $DEPS_ENABLED; do
	deps init $i
done
unset i
deps::clean


unset -f deps::{source,clean}
