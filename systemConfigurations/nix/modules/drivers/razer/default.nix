# razer/default.nix
#
{
  pkgs,
  sysinfo,
  ...
}: {
  hardware.openrazer.enable = true; # For razer devices
  environment.systemPackages = [pkgs.openrazer-daemon]; # For razer devices
  users.users.${sysinfo.target}.extraGroups = ["openrazer"];
  home-manager.users.${sysinfo.target} = {pkgs, ...}: {
    home.packages = with pkgs; [
      polychromatic
      alsa-tools # In order to fix audio issues on Razer Blade 15 (2023)
    ];
  };
}
