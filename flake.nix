{
  description = "Home Manager configuration of samchan0221";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixpkgs-24.11-darwin";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    let local = import ./.env.nix;
    in
    {
      darwinConfigurations.normal = inputs.darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./nix/modules/nix-core.nix
          ./nix/modules/apps.nix
          # home manager
          inputs.home-manager.darwinModules.home-manager
          {
            users.users.${local.username}.home = "/Users/samchan";
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = inputs // {
              defaultGitUsername = local.defaultGitUserName;
              defaultGitEmail = local.defaultGitEmail;
              username = local.username;
            };
            home-manager.users."samchan" = import ./nix/home;
          }
        ];
      };
    };
}
