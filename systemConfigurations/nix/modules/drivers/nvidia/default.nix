# nvidia/default.nix
#
{
  lib,
  config,
  sysinfo,
  ...
}:
with lib;
with sysinfo;
with builtins; {
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
    prime = mkIf {hostType = "laptop";} {
      nvidiaBusId = nBusId;
      intelBusId = mkIf hasAttr "iBusId" sysinfo iBusId;
      amdgpuBusId = mkIf hasAttr "aBusId" sysinfo aBusId;
      sync.enable = false; # Conflict with offload
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
    };
  };
}
