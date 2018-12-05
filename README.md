Overview
========

A bootstrap script for [Homeshick][homeshick], [Prezto][prezto],
[Homebrew][homebrew] and my personal dotfiles.

	curl -sL -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/mrmachine/dotfiles/master/bootstrap.sh | sh

Includes the following features:

  * Keep `~` clean by placing Zsh dotfiles in `~/.zsh`.
  * Enable optional Prezto modules: `archive`, `git`, `homebrew`, `node`,
    `osx`, `python`, `rsync`, `screen`, `wakeonlan`, `terminal`, `fasd`,
    `syntax-highlighting`, and `history-substring-search`.
  * Enable optional Prezto configuration: `dot-expansion` (editor),
    `highlighters` (syntax-highlighting), and `auto-title` (terminal).
  * Source Zprezto and Zsh scripts and combine SSH config files from
    `~/.zsh/zprezto.d`, `~/.zsh/zshrc.d`, `~/.ssh/config.d`, etc., making it
    easy to mixin partial dotfiles from collaborative castles.
  * Aliases: `ls`, `ps`, `sup` and `supctl` ([Supervisor][supervisor]).
  * Use Sublime Text as the default editor and for
    [Nose Progressive][nose-progressive].
  * Sublime Text [preferences][st-preferences] and plugins including:
      * [Anaconda][st-anaconda]
      * [Djaneiro][st-djaneiro]
      * [EditorConfig][st-editorconfig]
      * [GitGutter][st-gitgutter]
      * [Package Control][st-package-control]
  * Global [EditorConfig][editorconfig] preferences.
  * Global ignores for Git and Mercurial.
  * Terminal.app themes and color palettes based on the [Base16][base16]
    colour scheme.
  * Global [Brewfile][homebrew-brewfile] for command line and GUI apps.

You should add to, delete, extend or replace the default configuration as you
see fit, then commit and push your changes to a remote repository.

[base16]: https://github.com/chriskempson/base16
[editorconfig]: http://editorconfig.org
[homebrew]: http://brew.sh
[homebrew-brewfile]: https://github.com/Homebrew/homebrew-bundle
[homeshick]: https://github.com/andsens/homeshick/
[nose-progressive]: https://github.com/erikrose/nose-progressive
[prezto]: https://github.com/sorin-ionescu/prezto/
[sourcetree]: http://www.sourcetreeapp.com/
[st-anaconda]: https://github.com/DamnWidget/anaconda
[st-djaneiro]: https://github.com/squ1b3r/Djaneiro
[st-editorconfig]: https://github.com/sindresorhus/editorconfig-sublime
[st-gitgutter]: https://github.com/jisaacks/GitGutter
[st-package-control]: https://github.com/wbond/sublime_package_control
[st-preferences]: https://github.com/mrmachine/dotfiles/tree/master/home/Library/Application%20Support/Sublime%20Text%203/Packages/User
[sublime-text]: http://www.sublimetext.com/
[supervisor]: http://supervisord.org/
