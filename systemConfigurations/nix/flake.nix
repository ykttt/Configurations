

# nixOS/flake.nix

{
  description = "Peng's Nix Configuration";
  outputs = inputs@{
    self,
    nixpkgs,
    nur,
    home-manager,
    ...
  }: let system = "x86_64-linux";
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
      url = "github:ykttt/ags";
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
    catppuccin.url = "github:catppuccin/nix";
    zen-browser.url = "github:ykttt/zen-browser-flake";
  };
}
