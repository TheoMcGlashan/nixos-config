{
  description = "NixOS + home-manager, multi-host";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      mkHost = { hostName, extraModules ? [] }:
        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit hostName; };
          modules = [
            ./configuration.nix
            ./hosts/${hostName}/hardware-configuration.nix
            ./hosts/${hostName}/host.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit hostName; };
              home-manager.users.thoe = import ./home.nix;
            }
          ] ++ extraModules;
        };
    in {
      nixosConfigurations.laptop  = mkHost { hostName = "laptop"; };
      nixosConfigurations.desktop = mkHost { hostName = "desktop"; };
    };
}
