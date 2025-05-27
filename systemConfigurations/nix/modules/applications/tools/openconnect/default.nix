# openconnect/default.nix
#
{
  pkgs,
  sysinfo,
  ...
}: {
  environment.systemPackages = with pkgs; [
    webkit2gtk
    openconnect
    networkmanagerapplet
    networkmanager-openconnect
  ];
  networking.networkmanager.plugins = ["openconnect"];
}
