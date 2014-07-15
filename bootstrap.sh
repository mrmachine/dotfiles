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
homeshick link homeshick

echo "Installing Prezto."
homeshick clone sorin-ionescu/prezto

echo "Installing dotfiles."
homeshick clone -b mrmachine/dotfiles
homeshick link dotfiles

ZSH=`which zsh`

if [ $ZSH != $SHELL ]; then
	echo "Changing shell to Zsh."
	chsh -s $ZSH
fi

echo "Prezto and Zsh installed. Open a new terminal window or tab."
