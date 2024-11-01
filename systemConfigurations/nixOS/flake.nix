{
        description = "Peng's NixOS Configuration";
        inputs = {
                nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
                nur.url = "github:nix-community/NUR";
                home-manager = {
                        url = "github:nix-community/home-manager";
                        inputs.nixpkgs.follows = "nixpkgs";
                };
                anyrun = {
                        url = "github:anyrun-org/anyrun";
                        inputs.nixpkgs.follows = "nixpkgs";
                };
                ags = {
                        url = "github:Aylur/ags";
                        inputs.nixpkgs.follows = "nixpkgs";
                };
                catppuccin.url = "github:catppuccin/nix";
                zen-browser.url = "github:MarceColl/zen-browser-flake";
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
                                        (import ./models/nixRazer-15)
                                        inputs.home-manager.nixosModules.home-manager {
                                                home-manager.extraSpecialArgs = { inherit inputs; };
                                        }
                                ];
                        };
                };
        };
}
