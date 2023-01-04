{ config, pkgs, ... }:

let imports = [
  ./tmux.nix
  ./zsh.nix
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
    tmux
    zsh
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
