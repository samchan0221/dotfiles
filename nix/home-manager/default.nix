{ config, specialArgs, ... }:

let
  imports = [
    ./tmux.nix
    ./zsh.nix
    ./git.nix
    ./lazygit.nix
    ./neovim.nix
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
    clang-tools
    lld
    ripgrep
    lldb
  ] ++ specialArgs.extraPackages;

  programs.java = with specialArgs.nixpkgs.${specialArgs.majorVersion};{
    enable = true;
    package = jdk17;
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
