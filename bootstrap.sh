
#!/bin/sh
# Heavily inspired by https://github.com/adamgotterer/dotfiles/blob/development/bootstrap.sh

# Check if something is installed
# https://stackoverflow.com/a/34389425
# TODO: Also test if on macos or linux... install or upgrade linuxbrew if not
# TODO: Seems like a thing that can be abstracted
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
else
    echo "### rcm already installed"
    brew update rcm
fi
# End Install rcm

# Install ZSH
which -s zsh
if [[ $? != 0 ]] ; then
    echo "### Installing zsh!"
    brew install zsh
    chsh -s $(which zsh)
else
    echo "### Updating ZSH"
    brew update zsh
fi

if [[ ZSH ]] ; then
    echo "#### OH MY ZSH INSTALLED"
else
    echo "### Installing OH MY ZSH"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    # change your shell to zsh
fi

# End Install ZSH

# Given a .vimrc with plugins configured, this should auto install these
# Consider adding neovim?
# vim
vim -es -u vimrc -i NONE -c "PlugInstall" -c "qa"
echo "### Don't forget to install color scheme!"
#TODO: How to test for xcode and if the system is up to date
# install Xcode Command Line Tools
#xcode-select --install

# Install the latest MacOS updates
#sudo softwareupdate -i -a

