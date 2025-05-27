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
  ];
  networking.networkmanager.plugins = with pkgs; [networkmanager-openconnect];
}
