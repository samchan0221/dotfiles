# auto_suggestion
bindkey '^f' autosuggest-accept

if [[ -z "${IN_NIX_SHELL}" ]]; then
  PS1="[normal] $PS1"
else
  PS1="[in-nix] $PS1"
fi

# if [[ $(uname -m) == 'arm64' ]]; then
#    eval "$(/opt/homebrew/bin/brew shellenv)"
# fi
