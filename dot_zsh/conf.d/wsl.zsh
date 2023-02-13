[[ "$(uname -r)" =~ "WSL" ]] || return
# WSL Specific
export WINGET="$HOME/win/AppData/Local/Microsoft/WindowsApps/winget.exe"
if [ -f "$WINGET" ]; then
	alias winget="$WINGET"
fi
unset WINGET

(( $+commands[cmd.exe] )) && CMD="$(which cmd.exe)" || CMD="/mnt/c/Windows/system32/cmd.exe"
export CMD

WIN_HOME="$(${CMD} /c "<nul set /p=%UserProfile%" 2>/dev/null)"
WIN_HOME="$(wslpath ${WIN_HOME})"
export WIN_HOME
