{ config, specialArgs, ... }:

let
  imports = [
    ./tmux.nix
    ./zsh.nix
    ./git.nix
    ./lazygit.nix
    ./neovim
  ];
  rust = import ./rust.nix specialArgs.nixpkgs."23.05";
in
{
  inherit imports;

  home = {
    username = specialArgs.username;
    homeDirectory = specialArgs.homeDirectory;
    stateVersion = "22.11";
  };

  home.packages = with specialArgs.nixpkgs.${specialArgs.majorVersion}; [
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
    clang
    lld
    ripgrep
  ] ++ specialArgs.extraPackages;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
