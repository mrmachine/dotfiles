Overview
========

A bootstrap script for [Homeshick][1] and [Prezto][2].

	curl -L http://bit.ly/mrmachine-dotfiles | sh

This will install Homeshick, Prezto, and my personal configuration dotfiles:

* Keep `~` clean by placing Zsh dotfiles in `~/.zsh`.
* Enable optional Prezto modules: `archive`, `git`, `homebrew`, `node`, `osx`,
  `python`, `rsync`, `screen`, `wakeonlan`, `terminal`, `fasd`,
  `syntax-highlighting`, and `history-substring-search`.
* Enable optional Prezto configuration: `dot-expansion` (editor),
  `highlighters` (syntax-highlighting), and `auto-title` (terminal).
* Source multiple Zsh rc scripts from `~/.zsh/rc.d` and combine multiple SSH
  config files from `~/.ssh/config.d`, making it easy to mixin partial dotfiles
  from multiple collaborative castles.
* Aliases: `ls`, `ps`, `st` ([SourceTree][3]), `sup` and `supctl`
  ([Supervisor][4]), and `sub` ([Sublime Text][5]).
* Sublime Text 3 preferences.
* Editorconfig.
* Global ignores for Git and Mercurial.

You should add to, delete, extend or replace the default configuration as you
see fit, then commit and push your changes to a remote repository.

[1]: https://github.com/andsens/homeshick/
[2]: https://github.com/sorin-ionescu/prezto/
[3]: http://www.sourcetreeapp.com/
[4]: http://supervisord.org/
[5]: http://www.sublimetext.com/
