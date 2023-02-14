[[ "$(uname -r)" =~ "WSL" ]] || return
# WSL Specific
export WINGET="$HOME/win/AppData/Local/Microsoft/WindowsApps/winget.exe"
if [ -f "$WINGET" ]; then
	alias winget="$WINGET"
fi

(( $+commands[cmd.exe] )) && CMD="$(which cmd.exe)" || CMD="/mnt/c/Windows/system32/cmd.exe"
export CMD

WIN_HOME="$(wslpath $(${CMD} /c "<nul set /p=%UserProfile%" 2>/dev/null))"
export WIN_HOME

[ -L "${HOME}/win" ] && [ -e "${HOME}/win" ] || \
	ln -s "${WIN_HOME}" "${HOME}/win"
