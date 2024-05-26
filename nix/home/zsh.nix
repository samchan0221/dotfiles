{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    initExtra = builtins.readFile ../../.config/zsh/after.zshrc;
    plugins = [
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.8.0";
          sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
        };
      }
    ];
    sessionVariables = {
      LANG = "en_US@UTF-8";
    };
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
