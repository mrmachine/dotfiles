hash zsh 2>/dev/null || {
	echo >&2 "Zsh is not installed. Aborting."
	exit 1
}

if [ -d ~/.homesick ]; then
	echo >&2 "~/.homesick directory already exists. Aborting."
	exit 1
fi

echo "Installing Homeshick."
git clone https://github.com/andsens/homeshick.git ~/.homesick/repos/homeshick
source ~/.homesick/repos/homeshick/homeshick.sh

echo "Cloning Homeshick castles."
homeshick clone -b DamnWidget/anaconda
homeshick clone -b jisaacks/GitGutter
homeshick clone -b mrmachine/dotfiles
homeshick clone -b sindresorhus/editorconfig-sublime
homeshick clone -b sorin-ionescu/prezto
homeshick clone -b squ1b3r/Djaneiro
homeshick clone -b wbond/sublime_package_control

echo "Linking Homeshick castles."
homeshick link

ZSH="$(which zsh)"

if [ $ZSH != $SHELL ]; then
	echo "Changing shell to Zsh."
	if [ -z "$(grep $ZSH /etc/shells)" ]; then
		echo $ZSH | sudo tee -a /etc/shells
	fi
	chsh -s $ZSH
fi

echo "Installed. Open a new terminal window or tab."
