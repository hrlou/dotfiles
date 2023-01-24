# Installation

```sh
# install chezmoi
sh -c "$(curl -fsLS get.chezmoi.io)"

# my gitlab server uses port 2052, because of cloudflare
printf "Host git.hrlou.net\n\tHostname git.hrlou.net\n\tUser git\n\tPort 2052\n" >> ~/.ssh/config

# initialise repository
chezmoi init git@git.hrlou.net:hrlou/dotfiles.git

# install
chezmoi update
```
