# krita/default.nix
#
{
  pkgs,
  sysinfo,
  ...
}: {
  home-manager.users.${sysinfo.target}.home.packages = [pkgs.krita];
}
