# Tools and general env setup
export PATH=/bin:/usr/bin:/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH
export PATH=$PATH:/usr/local/opt/python/libexec/bin
export PATH="$PATH:/usr/local/opt/gnu-sed/libexec/gnubin"
export PATH="$PATH:~/.dotnet/tools"

# Go https://www.ookangzheng.com/asdf-to-manage-multiple-golang-on-mac/
export GOV=$(asdf where golang)
export GOROOT=$GOV/go
export PATH=$PATH:$GOROOT/bin

# Android
export ANDROID_HOME=/Users/drew/Library/Android/sdk
export PATH=$PATH:~/Library/Android/sdk/tools
export PATH=$PATH:~/Library/Android/sdk/tools/bin
export PATH=$PATH:~/Library/Android/sdk/platform-tools

# JDK
export PATH="$PATH:/opt/homebrew/opt/openjdk/bin"
export PATH="$PATH:/opt/homebrew/opt/openjdk@17/bin"

# GPG https://www.gnupg.org/(it)/documentation/manuals/gnupg/Common-Problems.html
export GPG_TTY=$(tty)

# PostgreSQL (libpq)
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/libpq/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libpq/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libpq/lib/pkgconfig"
