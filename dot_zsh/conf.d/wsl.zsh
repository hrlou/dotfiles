[[ "$(uname -r)" =~ "WSL" ]] || return
# WSL Specific
export WINGET="$HOME/win/AppData/Local/Microsoft/WindowsApps/winget.exe"
if [ -f "$WINGET" ]; then
	alias winget="$WINGET"
fi
unset WINGET

WIN_HOME="$(cmd.exe /c "<nul set /p=%UserProfile%" 2>/dev/null)"
WIN_HOME="$(wslpath ${WIN_HOME})"
