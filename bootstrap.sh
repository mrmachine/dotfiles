command -v zsh >/dev/null 2>&1 || {
	echo >&2 "Zsh is not installed. Aborting."
	exit 1
}

if [ ! -d ~/.homesick/repos/homeshick ]; then
	echo "Installing Homeshick."
	git clone https://github.com/andsens/homeshick.git ~/.homesick/repos/homeshick
	source ~/.homesick/repos/homeshick/homeshick.sh
fi

if [ ! -d ~/.homesick/repos/prezto ]; then
	echo "Installing `sorin-ionescu/prezto`."
	homeshick clone -b sorin-ionescu/prezto
fi

if [ ! -d ~/.homesick/repos/dotfiles ]; then
	echo "Installing `mrmachine/dotfiles`."
	homeshick clone -b mrmachine/dotfiles
	# TODO: Backup existing files and force linking.
	homeshick link
fi

ZSH=`which zsh`

if [ $ZSH != $SHELL ]; then
	echo "Changing shell to Zsh."
	chsh -s $ZSH
fi

echo "Prezto and Zsh installed. Open a new terminal window or tab."
