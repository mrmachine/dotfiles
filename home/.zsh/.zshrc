source ${ZDOTDIR:-$HOME}/.zprezto/runcoms/zshrc

# Load homeshick function and zsh completion.
source $HOME/.homesick/repos/homeshick/homeshick.sh
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

# ls.
alias ls='ls -FG'

# ps.
alias ps='ps -o pid,rss,pcpu,command'

# SourceTree.
alias st='/Applications/SourceTree.app/Contents/Resources/stree'

# Supervisor.
alias sup='supervisord -c $HOME/etc/supervisor/supervisord.conf -d $HOME/etc/supervisor'
alias supctl='supervisorctl -c $HOME/etc/supervisor/supervisord.conf '

# Sublime Text.
alias sub='"/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl"'
