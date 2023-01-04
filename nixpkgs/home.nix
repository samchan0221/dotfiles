{ config, pkgs, ... }:

let imports = [
  ./tmux.nix
  ./zsh.nix
  ./git.nix
];
in
{
  inherit imports;

  home = {
    username = "samchan";
    homeDirectory = "/Users/samchan";
    stateVersion = "22.05";
  };

  home.packages = with pkgs; [
    git
    tmux
    zsh
    lazygit
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
