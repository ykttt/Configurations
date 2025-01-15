# nixRazer-15/default.nix
#
{
  nur,
  inputs,
  nixpkgs,
  nixpkgs24-11,
  nix-matlab,
  ...
}: let
  system = "x86_64-linux";
  extraArgs = {
    inherit inputs;
    sysinfo = {
      target = "km";
      hostName = "nixRazer-15";
    };
  };
  overlays = [
    nur.overlays.default
    nix-matlab.overlay
    (final: prev: {
      ver24-11 = import nixpkgs24-11 {inherit system;};
    })
  ];
in
  nixpkgs.lib.nixosSystem {
    specialArgs = extraArgs;
    pkgs = import nixpkgs {
      overlay = overlays;
      inherit system;
      config = {
        allowUnfree = true;
        cudaSupport = true;
      };
    };
    modules = [
      (import ../../modules/overrides)
      (import ./local)
      (import ./adapted)
      {
        system.stateVersion = "24.05";
        users.users.${extraArgs.sysinfo.target} = {
          description = extraArgs.sysinfo.target;
          isNormalUser = true;
          extraGroups = ["wheel"];
        };
      }
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          extraSpecialArgs = extraArgs;
          users.${extraArgs.sysinfo.target} = {
            home.stateVersion = "24.05";
            nixpkgs = {
              overlays = overlays;
              config = {
                allowUnfree = true;
                cudaSupport = true;
              };
            };
          };
        };
      }
    ];
  }
