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
  gcloudPkgs = pkgs.google-cloud-sdk.withExtraComponents [
    pkgs.google-cloud-sdk.components.gke-gcloud-auth-plugin
  ];
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
    ripgrep
    gcloudPkgs
    kubernetes-helm
    terraform-ls
    # rust
    python39
    haskellPackages.haskell-language-server
    neofetch
    deno
    valgrind
    clang
    lld
  ] ++ extraPackages;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
