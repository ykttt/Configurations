# nvidia/default.nix
#
{
  lib,
  config,
  ...
}: let
  c = config.hardware;
in {
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    open = false; # Disable open-source drivers
    modesetting.enable = true;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
    nvidiaSettings = true;
    powerManagement = {
      enable = false; # Experimental, may cause problems
      finegrained = false;
    };
    prime = lib.mkIf c.laptop {
      nvidiaBusId = c.nBusId;
      intelBusId = c.iBusId;
      amdgpuBusId = c.aBusId;
      sync.enable = false; # Conflict with offload
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
    };
  };
}
