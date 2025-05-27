# local/hardware.nix
#
{sysinfo, ...}: {
  hardware = {
    graphics.enable = true;
    laptop = true;
    iBusId = "PCI:0:2:0";
    nBusId = "PCI:1:0:0";
  };
  home-manager.users.${sysinfo.target} = {pkgs, ...}: {
    home.packages = [pkgs.alsa-tools]; # In order to fix audio issues on Razer Blade 15 (2023)
  };
}
