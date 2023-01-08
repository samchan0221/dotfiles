{ config, pkgs, specialArgs, ... }:

let imports = [
  ./tmux.nix
  ./zsh.nix
  ./git.nix
  ./neovim.nix
];
in
{
  inherit imports;

  home = {
    username = specialArgs.username;
    homeDirectory = specialArgs.homeDirectory;
    stateVersion = "22.11";
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
