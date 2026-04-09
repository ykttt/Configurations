# ovr/hardware.nix
#
{lib, ...}:
with lib; let
  busIDType = types.strMatching "([[:print:]]+[\:\@][0-9]{1,3}\:[0-9]{1,2}\:[0-9])?";
  devPathType = types.strMatching "(/dev/[^[:space:]]+)?";
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
      description = "Bus ID of Nvidia GPU.";
    };
    aBusId = mkOption {
      type = busIDType;
      default = "";
      description = "Bus ID of AMD GPU.";
    };
    irCamPath = mkOption {
      type = devPathType;
      default = "";
      description = "IR/RGB camera device path";
    };
  };
}
