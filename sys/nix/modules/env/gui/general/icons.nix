# general/icons.nix
#
{sysinfo, ...}: {
  home-manager.users.${sysinfo.target} = {pkgs, ...}: {
    gtk = {
      enable = true;
      iconTheme = {
        name = "Papirus-Dark"; # theme name (must match a dir under share/icons)
        package = pkgs.papirus-icon-theme;
      };
    };
  };
}
