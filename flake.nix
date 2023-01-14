{
  description = "Home Manager configuration of samchan0221";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-22.11";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-22.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay/stable";
    };
  };

  outputs = { nixpkgs, home-manager, rust-overlay, flake-utils, ... }:
    {
      homeConfigurations.linux =
        let
          overlays = [ (import rust-overlay) ];
          pkgs = import nixpkgs
            {
              system = "x86_64-linux";
              inherit overlays;
            };
        in
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [
            ./nix/home.nix
          ];

          extraSpecialArgs = {
            username = "sam_chan";
            homeDirectory = "/home/sam_chan";
          };
        };

      homeConfigurations.darwin =
        let
          system = "aarch64-darwin";
          pkgs = nixpkgs.legacyPackages.${system};
        in
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [
            ./nix/home.nix
          ];

          extraSpecialArgs = {
            username = "samchan";
            homeDirectory = "/Users/samchan";
            packages = pkgs: with pkgs;[
              cocoapods
            ];
          };
        };
    };
}
