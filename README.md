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

1. rcup -d ~/.dotfiles
2. For tagged use rcup -t tag1 tag2

TODO: rcup doesn't hit tags so need to have solution for that. At the very least a script to run
