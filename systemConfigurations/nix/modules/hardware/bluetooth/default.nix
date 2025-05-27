# bluetooth/default.nix
#
{
  lib,
  config,
  ...
}: let
  c = config.hardware;
in {
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        ControllerMode = "dual";
        FastConnectable = "true";
        # Experimental = "true";
      };
      Policy = {AutoEnable = "true";};
      # LE = {EnableAdvMonInterleaveScan = "true";};
    };
  };
}
