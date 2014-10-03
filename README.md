Overview
========

A bootstrap script for [Homeshick][1], [Prezto][2] and my personal dotfiles.

	curl -L http://bit.ly/mrmachine-dotfiles | sh

Includes the following features:

* Keep `~` clean by placing Zsh dotfiles in `~/.zsh`.
* Enable optional Prezto modules: `archive`, `git`, `homebrew`, `node`, `osx`,
  `python`, `rsync`, `screen`, `wakeonlan`, `terminal`, `fasd`,
  `syntax-highlighting`, and `history-substring-search`.
* Enable optional Prezto configuration: `dot-expansion` (editor),
  `highlighters` (syntax-highlighting), and `auto-title` (terminal).
* Source Zprezto and Zsh scripts and combine SSH config files from
  `~/.zsh/zprezto.d`, `~/.zsh/zshrc.d`, `~/.ssh/config.d`, etc., making it easy
  to mixin partial dotfiles from collaborative castles.
* Aliases: `ls`, `ps`, `st` ([SourceTree][3]), `sup` and `supctl`
  ([Supervisor][4]), and `sub` ([Sublime Text][5]).
* Use Sublime Text as the default editor.
* Sublime Text [preferences][6] and plugins including: [Anaconda][7],
  [Djaneiro][8], [EditorConfig][9] , [GitGutter][10], and
  [Package Control][11].
* Global [EditorConfig][12] preferences.
* Global ignores for Git and Mercurial.
* Terminal.app themes based on the [Base16][13] colour scheme.

You should add to, delete, extend or replace the default configuration as you
see fit, then commit and push your changes to a remote repository.

[1]: https://github.com/andsens/homeshick/
[2]: https://github.com/sorin-ionescu/prezto/
[3]: http://www.sourcetreeapp.com/
[4]: http://supervisord.org/
[5]: http://www.sublimetext.com/
[6]: https://github.com/mrmachine/dotfiles/tree/master/home/Library/Application%20Support/Sublime%20Text%203/Packages/User
[7]: https://github.com/DamnWidget/anaconda
[8]: https://github.com/sindresorhus/editorconfig-sublime
[9]: https://github.com/squ1b3r/Djaneiro
[10]: https://github.com/jisaacks/GitGutter
[11]: https://github.com/wbond/sublime_package_control
[12]: http://editorconfig.org
[13]: https://github.com/chriskempson/base16
