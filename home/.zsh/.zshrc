source ${ZDOTDIR:-$HOME}/.zprezto/runcoms/zshrc

# Source `rc.d/*.zsh` scripts.
for filename in ${ZDOTDIR:-$HOME}/rc.d/*.zsh; do
	source $filename
done
