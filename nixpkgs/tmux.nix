{
  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile ./../.config/tmux/tmux.conf;
  };
}
