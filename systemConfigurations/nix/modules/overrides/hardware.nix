# overrides/hardware.nix
#
{lib, ...}:
with lib; {
  options.hardware = {
    deviceType = mkOption {
      type = types.string;
      default = "";
      description = "Device type.";
    };
    iBusId = mkOption {
      type = types.string;
      default = "";
      description = "Bus ID for Intel GPU.";
    };
    nBusId = mkOption {
      type = types.string;
      default = "";
      description = "Bus ID for nvidia GPU.";
    };
    aBusId = mkOption {
      type = types.string;
      default = "";
      description = "Bus ID for AMD GPU.";
    };
  };
}
