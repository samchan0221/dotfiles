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
  };

  outputs = { nixpkgs, home-manager, ... }:
    {
      homeConfigurations.linux =
        let
          system = "x86_64-linux";
          pkgs = nixpkgs.legacyPackages.${system};
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
          };
        };
    };
}
