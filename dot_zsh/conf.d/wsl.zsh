[[ "$(uname -r)" =~ "WSL" ]] || return
# WSL Specific
export WINGET="$HOME/win/AppData/Local/Microsoft/WindowsApps/winget.exe"
if [ -f "$WINGET" ]; then
	alias winget="$WINGET"
fi
unset WINGET
