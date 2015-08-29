#!/bin/bash

# Ask for the administrator password and keep-alive.
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Dotfiles.
if [ ! -d "$HOME/.homesick/repos/homeshick" ]; then
    echo "Installing Homeshick."
    git clone https://github.com/andsens/homeshick.git "$HOME/.homesick/repos/homeshick"
fi
source "$HOME/.homesick/repos/homeshick/homeshick.sh"

echo "Cloning Homeshick castles."
[ ! -d "$HOME/.homesick/repos/anaconda" ] && homeshick clone -b DamnWidget/anaconda
[ ! -d "$HOME/.homesick/repos/base16-osx-color-palette" ] && homeshick clone -b chriskempson/base16-osx-color-palette
[ ! -d "$HOME/.homesick/repos/lanzz/bash-supergenpass" ] && homeshick clone -b lanzz/bash-supergenpass
[ ! -d "$HOME/.homesick/repos/Djaneiro" ] && homeshick clone -b squ1b3r/Djaneiro
[ ! -d "$HOME/.homesick/repos/dotfiles" ] && homeshick clone -b mrmachine/dotfiles
[ ! -d "$HOME/.homesick/repos/editorconfig-sublime" ] && homeshick clone -b sindresorhus/editorconfig-sublime
[ ! -d "$HOME/.homesick/repos/GitGutter" ] && homeshick clone -b jisaacks/GitGutter
[ ! -d "$HOME/.homesick/repos/prezto" ] && homeshick clone -b sorin-ionescu/prezto
[ ! -d "$HOME/.homesick/repos/sublime_package_control" ] && homeshick clone -b wbond/sublime_package_control

echo "Linking Homeshick castles."
homeshick link

# Crontab.
crontab - <<EOF
MAILTO=real.human@mrmachine.net
PATH=/Users/tailee/.pyenv/shims:/Users/tailee/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
SHELL=/usr/local/bin/zsh

@reboot  always.sh

# minute  hour  day/month  month  day/week  command

*  *  *    *  *    always.sh
0  0  *    *  *    daily.sh
0  1  *    *  tue  weekly.sh
0  1  1-7  *  wed  monthly.sh
EOF

# Homebrew.
echo "Installing Homebrew."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Caskroom.
echo "Installing Caskroom."
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
brew install caskroom/cask/brew-cask

# Brewfile.
echo "Installing brews and casks."
brew tap homebrew/bundle
brew bundle --global

# Node.
echo "Installing Bower."
npm install -g bower

# PostgreSQL.
echo "Configuring PostgreSQL."
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist

# pyenv.
echo "Configuring pyenv."
touch ~/.profile_homebrew
echo '# pyenv.' >> ~/.profile_homebrew
echo 'if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi' >> ~/.profile_homebrew
echo 'if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi' >> ~/.profile_homebrew
source ~/.profile_homebrew

# Python.
echo "Installing Python versions."
pyenv install 2.7.10
pyenv install 3.2.6
pyenv install 3.3.6
pyenv install 3.4.3
pyenv global 2.7.10 3.4.3 3.3.6 3.2.6
echo "Installing Python packages."
pip install -U pip
pip install django  # For `django-admin.py startproject`.
pip install ipython
pip install tox

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

* Comment out the `source virtualenvwrapper.sh` line from `prezto/modules/python/init.zsh`.
* Use [SuperGenPass](http://www.supergenpass.com/) to generate your iCloud and Dropbox passwords.
* Login to iCloud in System Preferences.
* Login to Dropbox and sync your 1Password vaults.
* Open your primary and shared 1Password vaults from Dropbox.
* Install the 1Password browser extensions.
* Register any trial software with licenses from 1Password vaults (1Password, Arq, Carbon Copy Cloner, iStat Menus, Moom, OmniGraffle, SourceTree, Sublime Text, Transmit, VMware Fusion, etc.)
* Configure hourly Arq backups to a NAS (SFTP) and daily backups to the cloud (Dropbox, Google Nearline, etc.)
* Configure BitTorrent Sync and connect shares.
* Configure daily Carbon Copy Cloner backups to a disk image (NAS) or locally attached disk.
* Configure Internet Accounts in System Preferences (e.g. Facebook, Google, etc.)
* Configure sync in Google Chrome and Firefox.
* Enable TRIM for SSDs: `sudo trimforce enable`.

EOF
