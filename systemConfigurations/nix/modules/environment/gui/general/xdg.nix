# general/xdg.nix
#
{
  pkgs,
  sysinfo,
  ...
}: {
  environment.systemPackages = [pkgs.xdg-utils];
  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-wlr
      ];
    };
  };
  environment.sessionVariables = {
    XDG_CACHE_HOME = "\${HOME}/.cache";
    XDG_CONFIG_HOME = "\${HOME}/.config";
    XDG_BIN_HOME = "\${HOME}/.local/bin";
    XDG_DATA_HOME = "\${HOME}/.local/share";
    # XDG_DATA_DIRS   = ["/var/lib/flatpak/exports/share" "\$HOME/.local/share/flatpak/exports/share"];
  };
  home-manager.users.${sysinfo.target} = {
    xdg.mimeApps.enable = true;
    home.stateVersion = "24.05";
  };
}
