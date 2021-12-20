
#!/bin/sh
# Heavily inspired by https://github.com/adamgotterer/dotfiles/blob/development/bootstrap.sh

# Check if something is installed
# https://stackoverflow.com/a/34389425

# TODO: Also test if on macos or linux... install or upgrade linuxbrew if not

#TODO: How to test for xcode and if the system is up to date
# install Xcode Command Line Tools
xcode-select --install

# Install the latest MacOS updates
sudo softwareupdate -i -a

# TODO: Seems like a thing that can be abstracted
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    echo "### Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
    # Old ruby command
    # ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "### Updating Homebrew"
    brew update
fi

# brew doctor just in case
brew doctor

# Get latest non apple git
# https://ajahne.github.io/blog/tools/2018/06/11/how-to-upgrade-git-mac.html
brew install git
# Make sure we use that version
export PATH=/usr/local/bin:$PATH
echo "### Current git version"
git --version

# install RCM to manage dotfiles (rcup is one of the bins installed, not rcm)
which -s rcup
if [[ $? != 0 ]] ; then
    echo "### Installing rcm to manage dotfiles"
    brew tap thoughtbot/formulae
    brew install rcm
else
    echo "### rcm already installed"
    brew upgrade rcm
fi

## sync dotfiles!
rcup -v -d ~/.dotfiles
# End Install rcm

# Install ZSH
which -s zsh
if [[ $? != 0 ]] ; then
    echo "### Installing zsh!"
    brew install zsh
    chsh -s $(which zsh)
else
    echo "### ZSH Already Exists"
    # Now that zsh is default on mac there's no need to upgrade unless I'm on linux
    # echo "### Updating ZSH"
    # brew upgrade zsh
fi

# ZSH is the dir that .oh-my-zsh lives in
if [[ ZSH ]] ; then
    echo "#### OH MY ZSH INSTALLED"
else
    echo "### Installing OH MY ZSH"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
# End Install ZSH

# Given a .vimrc with plugins configured, this should auto install these
# Consider adding neovim?
# vim
vim -es -u vimrc -i NONE -c "PlugInstall" -c "qa"
echo "### Vim ready to go!"

