{ specialArgs, ... }:
with specialArgs.utils;
{
  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile (mkConfigPath /tmux/tmux.conf);
  };
}
