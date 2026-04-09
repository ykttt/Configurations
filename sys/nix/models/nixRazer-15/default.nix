# nixRazer-15/default.nix
#
{inputs, ...}:
with inputs; let
  system = "x86_64-linux";
  extraArgs = {
    inherit inputs;
    sysinfo = {
      hostName = "nixRazer-15";
      system = system;
      target = "km";
    };
  };
  commonConfig = {
    allowUnfree = true;
    cudaSupport = true;
  };
  overlays = [
    nur.overlays.default
    # nix-matlab.overlay
    (final: prev: {
      stable = import nixpkgsStable {
        inherit system;
        config = commonConfig;
      };
      unstable = import nixpkgsUnstable {
        inherit system;
        config = commonConfig;
      };
    })
    (final: prev: {
      howdy = howdyNixpkgs.legacyPackages.${system}.howdy;
    })
  ];
in
  nixpkgs.lib.nixosSystem {
    specialArgs = extraArgs;
    pkgs = import nixpkgs {
      overlays = overlays;
      inherit system;
      config = commonConfig;
    };
    modules = [
      (howdyNixpkgs + "/nixos/modules/services/security/howdy/default.nix")
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
          backupFileExtension = "backup";
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
