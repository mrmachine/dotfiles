# Use Docker Swarm for orchestration.
export DOCKER_ORCHESTRATOR=swarm

# django-master-password.
export MASTER_PASSWORD=abc123

# GitUp.
export PATH="/Applications/GitUp.app/Contents/SharedSupport:$PATH"

# Go.
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# Homebrew, Gettext.
export PATH="/usr/local/opt/gettext/bin:$PATH"

# Homebrew, OpenSSL.
export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/openssl/include"
export LDFLAGS="$LDFLAGS -L/usr/local/opt/openssl/lib"
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"

# Homebrew, Readline.
export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/readline/include"
export LDFLAGS="$LDFLAGS -L/usr/local/opt/readline/lib"

# Postgres.app.
export DYLD_FALLBACK_LIBRARY_PATH="/Applications/Postgres.app/Contents/Versions/9.5/lib:$DYLD_LIBRARY_PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/9.5/bin:$PATH"

# PyCharm.
export PATH="/Applications/PyCharm.app/Contents/MacOS:$PATH"

# Python.
export PYTHONDONTWRITEBYTECODE=1
export PYTHONWARNINGS=ignore

# # Build Python with framework/shared support (for PyInstaller).
# # See: https://github.com/yyuu/pyenv/wiki#how-to-build-cpython-with-framework-support-on-os-x
# export PYTHON_CONFIGURE_OPTS="--enable-framework"

# SourceTree.
export PATH="/Applications/SourceTree.app/Contents/Resources:$PATH"

# Sublime Text.
export PATH="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin:$PATH"

# Use Sublime Text as the default editor.
export EDITOR='subl -n -w'
export VISUAL="$EDITOR"

# Use Sublime Text as the editor for Nose Progressive.
export NOSE_PROGRESSIVE_EDITOR_SHORTCUT_TEMPLATE='  {dim_format}subl {path}:{line_number:<{line_number_max_width}}{normal}{function_format}{hash_if_function}{function}{normal}'

# Visual Studio Code.
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"
