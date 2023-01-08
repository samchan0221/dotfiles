# environment variables
ANDROID_HOME=$PATH:$HOME/Library/Android/sdk
ANDROID_SDK_ROOT=$PATH:$HOME/Library/Android/Sdk

PATH=/opt/homebrew/opt/python@3.10/bin:$PATH
PATH=$PATH:~/.local/nvim/bin
PATH=$PATH:$ANDROID_HOME/emulator
PATH=$PATH:$ANDROID_HOME/tools
PATH=$PATH:$ANDROID_HOME/tools/bin
PATH=$PATH:$ANDROID_HOME/platform-tools
PATH=$PATH:$HOME/.poetry/bin
CLOUDSDK_PYTHON=/usr/bin/python
XDG_CONFIG_HOME=$HOME/.config

# aliases
alias ls="ls -p -G"
alias la="ls -A"
alias ll="ls -l"
alias lla="ll -A"
alias lag="lazygit"

# nix link
source $HOME/.nix-profile/etc/profile.d/nix.sh
