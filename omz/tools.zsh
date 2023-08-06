# Enable brew command on Apple M1 CPU
eval $(/opt/homebrew/bin/brew shellenv)

# Python
eval "$(pyenv init --path)"

# ASDF
. /opt/homebrew/opt/asdf/libexec/asdf.sh