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

if [ ! -d "$HOME/.homesick/repos/homeshick" ]; then
	echo "Installing Homeshick."
	git clone https://github.com/andsens/homeshick.git "$HOME/.homesick/repos/homeshick"
fi
source "$HOME/.homesick/repos/homeshick/homeshick.sh"

echo "Cloning Homeshick castles."
[ ! -d "$HOME/.homesick/repos/anaconda" ] && homeshick clone -b DamnWidget/anaconda
[ ! -d "$HOME/.homesick/repos/Djaneiro" ] && homeshick clone -b squ1b3r/Djaneiro
[ ! -d "$HOME/.homesick/repos/dotfiles" ] && homeshick clone -b mrmachine/dotfiles
[ ! -d "$HOME/.homesick/repos/editorconfig-sublime" ] && homeshick clone -b sindresorhus/editorconfig-sublime
[ ! -d "$HOME/.homesick/repos/GitGutter" ] && homeshick clone -b jisaacks/GitGutter
[ ! -d "$HOME/.homesick/repos/prezto" ] && homeshick clone -b sorin-ionescu/prezto
[ ! -d "$HOME/.homesick/repos/sublime_package_control" ] && homeshick clone -b wbond/sublime_package_control

echo "Linking Homeshick castles."
homeshick link

cat <<EOF

Installed. Open a new terminal window or tab.
If you have any private Homeshick castles, you should clone and link them:

    homeshick clone <username>/<repository> (GitHub shortcut)
    homeshick clone https://bitbucket.org/<username>/<repository>.git (HTTPS)
    homeshick clone git@bitbucket.org:<username>/<repository>.git (SSH)
    homeshick link <repository>

EOF
