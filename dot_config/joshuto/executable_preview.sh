#!/usr/bin/env bash

shift
FILE_PATH="$1"

case $(file -b --mime-type "${FILE_PATH}") in
	text/* | application/json)
		# bat "${FILE_PATH}"
		bat \
			--paging=never \
			--color=always \
			"${FILE_PATH}"
		exit 0
		;;
	application/x-mach-binary | application/zip)
		ls -lha "${FILE_PATH}"
		exit 0
		;;
	*)
		exit 0
		;;
esac

exit 0
