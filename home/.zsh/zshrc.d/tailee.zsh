# Django.
alias dr='python manage.py runserver'
alias drp='python manage.py runserver_plus'
alias ds='python manage.py shell'
alias dsp='python manage.py shell_plus'

# Docker.
alias drm='docker rm -v $(docker ps -a -q -f status=created -f status=exited)'
alias drmi='docker rmi $(docker images -f "dangling=true" -q)'
alias drun='docker-compose run --rm --service-ports'

# Git.
git_merged_diff() {
	comm -23 <(git branch -r --merged $1) <(git branch -r --merged $2)
}

# Git short and venv status. See: https://gist.github.com/mrmachine/e33435c53a0ef9873b17
git_status() {
	STATUS=$(git status -s 2> /dev/null)
	LOCAL=$(git rev-parse "@" 2> /dev/null)
	UPSTREAM=$(git rev-parse "@{u}" 2> /dev/null)
	if [[ -n $STATUS ]] || ([[ -n $UPSTREAM ]] && [[ $LOCAL != $UPSTREAM ]]); then
		git status -bs
	fi
}
venv_git_status() {
	[[ ! -d "$VIRTUAL_ENV" ]] && return
	DIR="$PWD"
	for repo in $(find "$VIRTUAL_ENV" -type d -name .git); do
		cd $(dirname "$repo")
		if [[ -n $(git_status) ]]; then
			echo
			echo "$PWD"
			git_status
			echo
		fi
	done
	cd "$DIR"
}
alias gs='git_status'
alias vs='venv_git_status'

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
