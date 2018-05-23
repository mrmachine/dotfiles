# Use Docker Swarm for orchestration.
export DOCKER_ORCHESTRATOR=swarm

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
export PATH=/usr/local/opt/gettext/bin:$PATH

# Homebrew, OpenSSL.
export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/openssl/include"
export LDFLAGS="$LDFLAGS -L/usr/local/opt/openssl/lib"
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"

# Homebrew, Readline.
export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/readline/include"
export LDFLAGS="$LDFLAGS -L/usr/local/opt/readline/lib"

# ICEkit.
export MASTER_PASSWORD=abc123

# Postgres.app.
export DYLD_FALLBACK_LIBRARY_PATH=/Applications/Postgres.app/Contents/Versions/latest/lib:$DYLD_LIBRARY_PATH
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

# Python.
export PYTHONDONTWRITEBYTECODE=1
export PYTHONWARNINGS=ignore

# # Build Python with framework/shared support (for PyInstaller).
# # See: https://github.com/yyuu/pyenv/wiki#how-to-build-cpython-with-framework-support-on-os-x
# export PYTHON_CONFIGURE_OPTS="--enable-framework"

# Visual Studio Code.
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
