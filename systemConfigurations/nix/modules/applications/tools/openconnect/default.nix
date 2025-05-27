# openconnect/default.nix
#
{
  pkgs,
  sysinfo,
  ...
}: {
  environment.systemPackages = with pkgs; [
    openconnect
    networkmanagerapplet
  ];
  networking.networkmanager.plugins = with pkgs; [networkmanager-openconnect];
}
