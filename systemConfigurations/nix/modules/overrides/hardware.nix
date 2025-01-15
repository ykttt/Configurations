# overrides/hardware.nix
#
{lib, ...}:
with lib; let
  busIDType = types.strMatching "([[:print:]]+[\:\@][0-9]{1,3}\:[0-9]{1,2}\:[0-9])?";
in {
  options.hardware = {
    laptop = mkOption {
      type = types.bool;
      default = false;
      description = "Device type.";
    };
    iBusId = mkOption {
      type = busIDType;
      default = "";
      description = "Bus ID of the Intel GPU.";
    };
    nBusId = mkOption {
      type = busIDType;
      default = "";
      description = "Bus ID of the nvidia GPU.";
    };
    aBusId = mkOption {
      type = busIDType;
      default = "";
      description = "Bus ID of the AMD GPU.";
    };
  };
}
