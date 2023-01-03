{
  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile ./../.configs/tmux/tmux.conf;
  };
}
