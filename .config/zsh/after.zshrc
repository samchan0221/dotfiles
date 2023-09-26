# auto_suggestion
bindkey '^f' autosuggest-accept

if [[ -z "${IN_NIX_SHELL}" ]]; then
  PS1="[normal] $PS1"
else
  PS1="[in-nix] $PS1"
fi

if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
