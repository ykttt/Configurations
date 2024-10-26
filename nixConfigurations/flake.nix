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
                nur.url = "github:nix-community/NUR";
                ags.url = "github:Aylur/ags";
        };
        outputs = inputs@{ self, nixpkgs, nur, home-manager, ... }:
        let system = "x86_64-linux";
        in {
                nixosConfigurations = {
                        nixRazer-15 = nixpkgs.lib.nixosSystem {
                                pkgs = import nixpkgs {
                                        inherit system;
                                        config.allowUnfree = true;
                                        overlays = [ nur.overlay ];
                                };
                                specialArgs = { inherit inputs; };
                                modules = [
                                        ./configuration.nix
                                        home-manager.nixosModules.home-manager {
                                                home-manager.users.km = import ./home.nix;
                                                home-manager.extraSpecialArgs = inputs;
                                        }
                                ];
                        };
                };
        };
}
