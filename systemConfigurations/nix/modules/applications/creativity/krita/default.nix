# krita/default.nix
#
{sysinfo, ...}: {
  home-manager.users.${sysinfo.target} = {pkgs, ...}: {
    home.packages = [pkgs.krita];
  };
}
