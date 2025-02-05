{
  description = "I hope NixOS is my last stop. I'm really tired of this hopping around";

  inputs = {
    nixpkgs.url = "github:NixOs/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager,... }@inputs:
  let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
        modules = [ ./configuration.nix ];
        specialArgs = { inherit inputs; };
      };
    };

    homeConfigurations = {
      r3z = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./users/default.nix ];
      };
    };
  };
}
