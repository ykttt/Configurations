# general/externalThemes.nix
#
{
  pkgs,
  sysinfo,
  ...
}: {
  home-manager.users.${sysinfo.target}.home.packages = [pkgs.nwg-look];
}
