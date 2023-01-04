{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    initExtraFirst = builtins.readFile ../.configs/zsh/before.zshrc;
    initExtra = builtins.readFile ../.configs/zsh/after.zshrc;
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
}
