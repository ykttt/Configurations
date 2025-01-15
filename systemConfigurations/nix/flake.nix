# nixOS/flake.nix
#
{
  description = "A Nix Configuration";
  outputs = inputs @ {
    nur,
    self,
    nixpkgs,
    nixpkgs24-11,
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
        nix-matlab = nix-matlab;
      };
    };
  };
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs24-11.url = "github:NixOS/nixpkgs/nixos-24.11";
    nur.url = "github:nix-community/NUR";
    catppuccin.url = "github:catppuccin/nix";
    matugen.url = "github:/InioX/Matugen?ref=refs/tags/v2.4.0";
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
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
