{ config, pkgs, ... }:

{
  home = {
    username = "samchan";
    homeDirectory = "/Users/samchan";
    stateVersion = "22.05";
  };

  home.packages = with pkgs; [ ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
