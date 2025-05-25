# nixRazer-15/default.nix
#
{inputs, ...}:
with inputs; let
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
    hyprpanel.overlay
    (final: prev: {
      stable = import nixpkgsStable {inherit system;};
      unstable = import nixpkgsUnstable {inherit system;};
    })
  ];
in
  nixpkgs.lib.nixosSystem {
    specialArgs = extraArgs;
    pkgs = import nixpkgs {
      overlays = overlays;
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
