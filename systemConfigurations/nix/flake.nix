

# nixOS/flake.nix

{
  description = "A Nix Configuration";
  outputs = inputs@{
    self,
    nixpkgs,
    nixpkgsStable,
    nur,
    home-manager,
    nix-matlab,
    ...
  }: let system = "x86_64-linux";
  in {
    nixosConfigurations = {
      nixRazer-15 = nixpkgs.lib.nixosSystem {
        pkgs = import nixpkgs {
          inherit system;
            config.allowUnfree = true;
            overlays = [
              nur.overlay
              nix-matlab.overlay
            ];
        };
        pkgsStable = import nixpkgsStable {
          inherit system;
          config.allowUnfree = true;
          overlays = [
            nur.overlay
            nix-matlab.overlay
          ];
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
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgsStable.url = "github:NixOS/nixos-24.11";
    nur.url = "github:nix-community/NUR";
    catppuccin.url = "github:catppuccin/nix";
    zen-browser.url = "github:ykttt/zen-browser-flake";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-matlab = {
      url = "github:ykttt/nix-matlab";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags = {
      url = "github:ykttt/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    anyrun = {
      url = "github:anyrun-org/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    matugen = {
      url = "github:/InioX/Matugen";
      # If you need a specific version:
      # ref = "refs/tags/matugen-v0.10.0";
    };
  };
}
