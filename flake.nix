{
  description = "Builds kernels for CachyNix using Garnix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    cachynix.url = "github:Mrn157/CachyNix";
  };

  outputs = { nixpkgs, cachynix, ... }@inputs:
    let
      lib = nixpkgs.lib;
      specialArgs = { inherit inputs; };
    in {
      nixosConfigurations = {
        lto-x86_64-v3 = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./configuration.nix 
            cachynix.nixosModules.default
          ];
          inherit specialArgs;
        };
      };
    };
}
