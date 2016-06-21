# Use Sublime Text as the default editor.
export EDITOR='subl -n -w'
export VISUAL=$EDITOR

# Use Sublime Text as the editor for Nose Progressive.
export NOSE_PROGRESSIVE_EDITOR_SHORTCUT_TEMPLATE='  {dim_format}subl {path}:{line_number:<{line_number_max_width}}{normal}{function_format}{hash_if_function}{function}{normal}'

# Add `~/bin` to `PATH`.
export PATH=$HOME/bin:$PATH

# Go.
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Homebrew.
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Postgres.
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin

# Python
export PYTHONWARNINGS=ignore
