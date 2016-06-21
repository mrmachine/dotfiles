# Django.
alias dr='python manage.py runserver'
alias drp='python manage.py runserver_plus'
alias ds='python manage.py shell'
alias dsp='python manage.py shell_plus'

# Docker.
eval "$(docker-machine env default)"

# Interaction Consortium Projects.
alias icprojects='cd ~/IC/Projects'

# ls.
alias ls='ls -FG'

# ps.
alias ps='ps -o pid,rss,pcpu,command'

# scp.
alias scpresume='rsync --partial --progress --rsh=ssh'

# SourceTree.
alias st='/Applications/SourceTree.app/Contents/Resources/stree'

# Supervisor.
alias sup='supervisord -c $HOME/etc/supervisor/supervisord.conf -d $HOME/etc/supervisor'
alias supctl='supervisorctl -c $HOME/etc/supervisor/supervisord.conf '

# Sublime Text.
alias sub='"/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl"'

# pyenv-virtualenvwrapper.
if (( $+commands[pyenv] )); then
	unset VIRTUAL_ENV_DISABLE_PROMPT  # Re-enable prompt, disabled by prezto.
	pyenv virtualenvwrapper
fi

# Zsh options.
setopt INTERACTIVE_COMMENTS
