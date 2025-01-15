# razer/default.nix
#
{
  pkgs,
  sysinfo,
  ...
}: {
  environment.systemPackages = [pkgs.openrazer-daemon]; # For razer devices
  users.users.${sysinfo.target}.extraGroups = ["openrazer"];
  hardware.openrazer.enable = true;
  home-manager.users.${sysinfo.target} = {pkgs, ...}: {
    home.packages = [pkgs.polychromatic];
  };
}
