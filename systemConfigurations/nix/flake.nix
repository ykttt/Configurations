# nixOS/flake.nix
#
{
  description = "A Nix Configuration";
  outputs = inputs @ {
    nur,
    self,
    nixpkgs,
    nixpkgs24-11,
    nixpkgsUnstable,
    home-manager,
    nix-matlab,
    ...
  }: {
    nixosConfigurations = {
      nixRazer-15 = import ./models/nixRazer-15 {
        nur = nur;
        inputs = inputs;
        nixpkgs = nixpkgs;
        nixpkgs24-11 = nixpkgs24-11;
        nixpkgsUnstable = nixpkgsUnstable;
        nix-matlab = nix-matlab;
      };
    };
  };
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs24-11.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgsUnstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
    matugen.url = "github:/InioX/Matugen?ref=refs/tags/v2.4.0";
    anyrun = {
      url = "github:anyrun-org/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      # url = "github:nix-community/home-manager/release-24.11";
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-matlab = {
      url = "github:ykttt/nix-matlab";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel";
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
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      # inputs.nixpkgs.follows = "nixpkgsUnstable";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
