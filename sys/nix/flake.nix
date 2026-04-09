# nixOS/flake.nix
#
{
  description = "A Nix Configuration";
  outputs = inputs @ {
    nur,
    self,
    nixpkgs,
    nixpkgsStable,
    nixpkgsUnstable,
    home-manager,
    ...
  }: {
    nixosConfigurations = {
      nixRazer-15 = import ./models/nixRazer-15 {
        nur = nur;
        inputs = inputs;
        nixpkgs = nixpkgs;
        nixpkgsStable = nixpkgsStable;
        nixpkgsUnstable = nixpkgsUnstable;
      };
    };
  };
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgsStable.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgsUnstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
    howdyNixpkgs.url = "github:fufexan/nixpkgs/howdy";
    hyprcursor-phinger = {
      url = "github:Jappie3/hyprcursor-phinger";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    matugen = {
      url = "github:InioX/matugen";
      # url = "github:InioX/matugen?ref=refs/tags/v2.4.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    matugenThemes = {
      url = "github:InioX/matugen-themes";
      flake = false;
    };
    anyrun = {
      url = "github:anyrun-org/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      # url = "github:nix-community/home-manager/release-25.05";
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
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
