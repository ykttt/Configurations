# openconnect/default.nix
#
{
  pkgs,
  sysinfo,
  ...
}: {
  environment.systemPackages = with pkgs; [
    openconnect
  ];
  networking.networkmanager.plugins = with pkgs; [networkmanager-openconnect];
}
