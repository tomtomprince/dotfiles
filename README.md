## Assumptions

1. Repo is cloned to ~/.dotfiles - rcm defaults to the directory and I've tried to stick to defaults as much as possible i.e.

```
git clone https://github.com/tomtomprince/dotfiles.git ~/.dotfiles
```

2. zsh is the terminal of choice
3. Currently Mac only

## Install the basics

```
sh ~/.dotfiles/bootstrap.sh
```

This installs/updates the following: Homebrew, rcm, zsh, and oh-my-zsh

## Sync dotfiles with rcm

```
rcup -d ~/.dotfiles
```
