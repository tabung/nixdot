{
  description = "I hope NixOS is my last stop. I'm really tired of this hopping around";

  inputs = {
    nixpkgs.url = "github:NixOs/nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
        modules = [ ./configuration.nix ];
      };
    };

    homeConfigurations = {
      tabun = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./users/default.nix ];
      };
    };
  };
}
