# nvidia/default.nix
#
{
  lib,
  config,
  ...
}:
with lib;
with hardware; {
  services.xserver.videoDrivers = ["nvidia"];
  nvidia = {
    open = false; # Disable open-source drivers
    modesetting.enable = true;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
    nvidiaSettings = true;
    powerManagement = {
      enable = false; # Experimental, may cause problems
      finegrained = false;
    };
    prime = mkIf (deviceType == "laptop") {
      nvidiaBusId = nBusId;
      intelBusId = mkIf iBusId iBusId;
      amdgpuBusId = mkIf aBusId aBusId;
      sync.enable = false; # Conflict with offload
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
    };
  };
}
