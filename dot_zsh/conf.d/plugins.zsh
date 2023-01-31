# First
ZSH_HIGHLIGHT_DIRS_BLACKLIST+=(/mnt/c)

for _pluginfile in $ZDOTDIR/plugins/*/*.plugin.zsh(.N); do
  source "$_pluginfile"
done
unset _pluginfile
