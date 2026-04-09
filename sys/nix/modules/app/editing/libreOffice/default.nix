# libreOffice/default.nix
#
{sysinfo, ...}: {
  home-manager.users.${sysinfo.target} = {pkgs, ...}: {
    home.packages = with pkgs; [libreoffice];
  };
}
