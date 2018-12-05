#!/bin/bash

# Ask for the administrator password and keep-alive.
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Command line tools.
echo "Installing command line tools, if necessary. Press any key to continue."
sudo xcode-select --install > /dev/null 2>&1
read -n 1 -s

# Homebrew.
echo "Installing Homebrew."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Brewfile.
echo "Installing from global Brewfile."
brew bundle --global

# Homeshick.
export HOMESHICK_DIR=/usr/local/opt/homeshick
source /usr/local/opt/homeshick/homeshick.sh

echo "Cloning Homeshick castles."
# General.
[ ! -d "$HOME/.homesick/repos/base16-osx-color-palette" ] && homeshick clone -b chriskempson/base16-osx-color-palette
[ ! -d "$HOME/.homesick/repos/dotfiles" ] && homeshick clone -b mrmachine/dotfiles
[ ! -d "$HOME/.homesick/repos/prezto" ] && homeshick clone -b sorin-ionescu/prezto
# Sublime Text.
[ ! -d "$HOME/.homesick/repos/anaconda" ] && homeshick clone -b DamnWidget/anaconda
[ ! -d "$HOME/.homesick/repos/Djaneiro" ] && homeshick clone -b squ1b3r/Djaneiro
[ ! -d "$HOME/.homesick/repos/editorconfig-sublime" ] && homeshick clone -b sindresorhus/editorconfig-sublime
[ ! -d "$HOME/.homesick/repos/GitGutter" ] && homeshick clone -b jisaacks/GitGutter
[ ! -d "$HOME/.homesick/repos/sublime_package_control" ] && homeshick clone -b wbond/sublime_package_control

echo "Linking Homeshick castles."
homeshick link

# Python.
eval "$(pyenv init -)"
echo "Installing Python versions."
pyenv install 2.6.9
pyenv install 2.7.15
pyenv install 3.6.6
pyenv global 3.6.6 2.7.15

# Zsh.
hash zsh 2>/dev/null || {
    echo >&2 "Zsh is not installed. Aborting."
    exit 1
}
ZSH="$(which zsh)"
if [ "$ZSH" != "$SHELL" ]; then
    echo "Changing shell to Zsh."
    if [ -z "$(grep $ZSH /etc/shells)" ]; then
        echo "$ZSH" | sudo tee -a /etc/shells
    fi
    chsh -s "$ZSH"
fi

# Now the manual steps.
cat <<EOF

Homeshick and castles installed. Open a new terminal window or tab for dotfiles
to take effect.

If you have any private Homeshick castles, you should clone and link them:

    homeshick clone <username>/<repository> (GitHub shortcut)
    homeshick clone https://bitbucket.org/<username>/<repository>.git (HTTPS)
    homeshick clone git@bitbucket.org:<username>/<repository>.git (SSH)
    homeshick link <repository>

Additional manual configuration:

* Install the 1Password browser extensions.
* Register any trial software with licenses from 1Password vaults (1Password, Arq, Carbon Copy Cloner, iStat Menus, Moom, OmniGraffle, SourceTree, Sublime Text, Transmit, VMware Fusion, etc.)
* Configure hourly Arq backups to the cloud (Google Drive, etc.)
* Configure Resilio Sync and connect shares.
* Configure daily Carbon Copy Cloner backups to a disk image (NAS) or locally attached disk.
* Configure Internet Accounts in System Preferences (e.g. Facebook, Google, etc.)
* Configure sync in Google Chrome and Firefox.

EOF
