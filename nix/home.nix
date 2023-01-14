{ config, pkgs, specialArgs, ... }:

let
  imports = [
    ./tmux.nix
    ./zsh.nix
    ./git.nix
    ./neovim.nix
  ];
  extraPackages = if specialArgs ? packages then specialArgs.packages pkgs else [ ];
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
    (rust-bin.stable."1.66.0".default.override {
      extensions = [
        "rust-src"
        "rust-analyzer"
      ];
    })
  ] ++ extraPackages;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
