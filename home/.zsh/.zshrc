# `.zshrc' is sourced in interactive shells. It should contain commands to set
# up aliases, functions, options, key bindings, etc.

source ${ZDOTDIR:-$HOME}/.zprezto/runcoms/zshrc

# Source `rc.d/*.zsh` scripts.
for filename in ${ZDOTDIR:-$HOME}/rc.d/*.zsh; do
	source $filename
done
