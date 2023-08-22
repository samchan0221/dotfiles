{
  programs.git = {
    enable = true;
    userName = "samchan0221";
    userEmail = "samchan0221@gmail.com";
    extraConfig = {
      core.editor = "nvim";
    };
  };
  programs.git.aliases = {
    l = "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all";
  };
}
