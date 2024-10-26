{
        description = "Peng's NixOS Configuration";
        inputs = {
                nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
                home-manager = {
                        url = "github:nix-community/home-manager";
                        inputs.nixpkgs.follows = "nixpkgs";
                };
                anyrun = {
                        url = "github:anyrun-org/anyrun";
                        inputs.nixpkgs.follows = "nixpkgs";
                };
                ags.url = "github:Aylur/ags";
        };
        outputs = inputs@{ self, nixpkgs, home-manager, ... }:
        let system = "x86_64-linux";
        in {
                nixosConfigurations = {
                        nixRazer-15 = nixpkgs.lib.nixosSystem {
                                pkgs = import nixpkgs { inherit system; };
                                # extraSpecialArgs = { inherit inputs; };
                                modules = [
                                        ./configuration.nix
                                        home-manager.nixModules.home-manager
                                ];
                        };
                };
        };
}
