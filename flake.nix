{
  description = "Home Manager configuration of samchan0221";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixpkgs-23.11-darwin";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs @ { nixpkgs
    , home-manager
    , darwin
    , ...
    }:
    let
      username = "samchan";
      defaultGitUsername = "samchan0221";
      defaultGitEmail = "samchan0221@gmail.com";
      system = "aarch64-darwin";
      hostname = "${username}-macbook";
      specialArgs =
        inputs
        // {
          inherit username hostname defaultGitUsername defaultGitEmail;
        };
    in
    {
      darwinConfigurations."${hostname}" = darwin.lib.darwinSystem {
        inherit system specialArgs;
        modules = [
          ./nix/modules/nix-core.nix
          # home manager
          home-manager.darwinModules.home-manager
          {
            users.users.${username}.home = "/Users/${username}";
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = specialArgs;
            home-manager.users.${username} = import ./nix/home;
          }
        ];
      };
    };
}
