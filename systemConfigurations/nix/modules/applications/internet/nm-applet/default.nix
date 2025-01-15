# nm-applet/default.nix
#
{
  pkgs,
  sysinfo,
  ...
}: {
  home-manager.users.${sysinfo.target} = {
    home.packages = [pkgs.networkmanagerapplet];
    services.network-manager-applet.enable = true;
  };
}
