
#!/bin/sh
# Heavily inspired by https://github.com/adamgotterer/dotfiles/blob/development/bootstrap.sh

# Check if something is installed
# https://stackoverflow.com/a/34389425
# TODO: Also test if on macos or linux... install or upgrade linuxbrew if not
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    echo "### Installing Homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "### Updating Homebrew"
    brew update
fi

# install RCM to manage dotfiles (rcup is one of the bins installed, not rcm)
which -s rcup
if [[ $? != 0 ]] ; then
    echo "### Installing rcm to manage dotfiles"
    brew tap thoughtbot/formulae
    brew install rcm
fi

#TODO: Install and configure zsh?

#TODO: How to test for xcode and if the system is up to date
# install Xcode Command Line Tools
#xcode-select --install

# Install the latest MacOS updates
#sudo softwareupdate -i -a

