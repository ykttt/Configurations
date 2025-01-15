# nm-applet/default.nix
#
{sysinfo, ...}: {
  home-manager.users.${sysinfo.target} = {pkgs, ...}: {
    home.packages = [pkgs.networkmanagerapplet];
    services.network-manager-applet.enable = true;
  };
}
