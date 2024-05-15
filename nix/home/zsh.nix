{ ... }:
{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    initExtra = builtins.readFile ../../.config/zsh/after.zshrc;
  };
  programs.zsh.oh-my-zsh = {
    enable = true;
    plugins = [
      "git"
      "sudo"
      "z"
      "yarn"
      "poetry"
      "rust"
      "vi-mode"
    ];
    theme = "afowler";
  };
  home.shellAliases = {
    lag = "lazygit";
  };
}
