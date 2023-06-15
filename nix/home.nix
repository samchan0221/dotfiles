{ config, pkgs, specialArgs, ... }:

let
  imports = [
    ./tmux.nix
    ./zsh.nix
    ./git.nix
    ./lazygit.nix
    ./neovim
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
    python311
    haskellPackages.haskell-language-server
    terraform-ls
    neofetch
    deno
    poetry
    valgrind
    clang
    lld
  ] ++ extraPackages;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
