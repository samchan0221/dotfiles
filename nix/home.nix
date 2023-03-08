{ config, pkgs, specialArgs, ... }:

let
  imports = [
    ./tmux.nix
    ./zsh.nix
    ./git.nix
    ./neovim.nix
    ./lazygit.nix
  ];
  extraPackages = if specialArgs ? packages then specialArgs.packages pkgs else [ ];
  rust = import ./rust.nix pkgs;
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
    rust
    python39
    ripgrep
    nodePackages.node2nix
  ] ++ extraPackages;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
