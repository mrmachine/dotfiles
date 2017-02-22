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

# Make unlinked OpenSSL discoverable. See: http://stackoverflow.com/a/33125400
OPENSSL_PREFIX="$(brew --prefix openssl)"
export CFLAGS="-I$OPENSSL_PREFIX/include"
export LDFLAGS="-L$OPENSSL_PREFIX/lib"
export SWIG_FEATURES="-cpperraswarn -includeall -I$OPENSSL_PREFIX/include"

# Postgres.app.
export DYLD_FALLBACK_LIBRARY_PATH=/Applications/Postgres.app/Contents/Versions/latest/lib:$DYLD_LIBRARY_PATH
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

# Python
export PYTHONDONTWRITEBYTECODE=1
export PYTHONWARNINGS=ignore
