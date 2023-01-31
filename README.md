# Installation

```sh
sh -c "$(BINDIR="$HOME/.local/bin"; curl -fsLS get.chezmoi.io)"
ssh git@git.hrlou.net || printf "Host git.hrlou.net\n\tHostname git.hrlou.net\n\tUser git\n\tPort 2052\n" >> ~/.ssh/config
chezmoi init $(ssh git@git.hrlou.net && printf "git@git.hrlou.net:hrlou/dotfiles.git" || printf "https://git.hrlou.net/hrlou/dotfiles.git")
chezmoi update
```
