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
      hostType = "laptop";
      nBusId = "PCI:1:0:0";
      iBusId = "PCI:0:2:0";
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
      {
        users = {
          users.${extraArgs.sysinfo.target} = {
            isNormalUser = true;
            description = extraArgs.sysinfo.target;
            extraGroups = ["wheel"];
          };
        };
        system.stateVersion = "24.05";
      }
      (import ./local)
      (import ./adapted)
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
