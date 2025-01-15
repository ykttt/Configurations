# hardware/drivers.nix
#
{sysinfo, ...}: {
  hardware.graphics.enable = true;
  home-manager.users.${sysinfo.target} = {pkgs, ...}: {
    home.packages = [pkgs.alsa-tools]; # In order to fix audio issues on Razer Blade 15 (2023)
  };
}
