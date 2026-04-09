# security/default.nix
#
{
  lib,
  config,
  ...
}:
with lib; let
  irCam = config.hardware.irCamPath;
  howdyPam = config.services.howdy.package + "/lib/security/pam_howdy.so";
  pamServices = [
    "sudo"
    "su"
    "login"
    "sddm"
    "polkit-1"
    "swaylock"
  ];
  mkHowdy = svc: {
    security.pam.services.${svc}.rules.auth.howdy = {
      order =
        (
          attrByPath
          ["security" "pam" "services" svc "rules" "auth" "unix" "order"]
          10000
          config
        )
        - 10;
      control = "sufficient";
      modulePath = howdyPam;
    };
  };
in
  mkMerge [
    {
      security = {
        sudo = {
          enable = true;
          wheelNeedsPassword = true;
        };
        rtkit.enable = true;
      };
      services.howdy = mkIf (irCam != "") {
        enable = true;
        settings = {
          video.device_path = irCam;
        };
      };
    }
    (mkIf config.services.howdy.enable
      (mkMerge (map mkHowdy pamServices)))
  ]
