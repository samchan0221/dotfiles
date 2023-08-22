{
  description = "Home Manager configuration of samchan0221";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-23.05";
    };
    nixpkgs-2211 = {
      url = "github:nixos/nixpkgs/nixos-22.11";
    };
    nixpkgs-unstable = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay/stable";
    };
  };

  outputs = { nixpkgs, nixpkgs-2211, nixpkgs-unstable, home-manager, rust-overlay, flake-utils, ... }:
    let
      nixpkgs-2305 = nixpkgs;
    in
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
            ./nix/home-manager
          ];

          extraSpecialArgs = {
            username = "sam_chan";
            homeDirectory = "/home/sam_chan";
          };
        };

      homeConfigurations.darwin =
        let
          system = "aarch64-darwin";
          nixpkgs = {
            "23.05" = nixpkgs-2305.legacyPackages.${system};
            "22.11" = nixpkgs-2211.legacyPackages.${system};
            unstable = nixpkgs-unstable.legacyPackages.${system};
          };
        in
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs."23.05"; # pkgs for home-manager itself (mainly std-env)

          modules = [
            ./nix/home-manager
          ];

          extraSpecialArgs = {
            inherit nixpkgs;
            username = "samchan";
            homeDirectory = "/Users/samchan";
            majorVersion = "23.05";
            extraPackages = [
              nixpkgs."23.05".cocoapods
            ];
            utils = {
              mkConfigPath = path: ./.config + path;
            };
          };
        };
    };
}
