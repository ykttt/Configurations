# openconnect/default.nix
#
{
  pkgs,
  sysinfo,
  ...
}: {
  environment.systemPackages = with pkgs; [
    openconnect
    gnome-control-center
  ];
  networking.networkmanager.plugins = with pkgs; [networkmanager-openconnect];
}
