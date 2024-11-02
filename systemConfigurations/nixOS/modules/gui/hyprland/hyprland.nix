

#hyprland/hyprland.nix

{
  pkgs,
  ...
}: {
  services = {
    power-profiles-daemon.enable = true;
    logind.powerKey = "ignore";
  };
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };
  home-manager.users.km = {
    pkgs,
    ...
  }: {
    xdg.desktopEntries."org.gnome.Settings" = {
      name = "Settings";
      comment = "Gnome Control Center";
      icon = "org.gnome.Settings";
      exec = "env XDG_CURRENT_DESKTOP=gnome ${pkgs.gnome-control-center}/bin/gnome-control-center";
      categories = ["X-Preferences"];
      terminal = false;
    };
    home.packages = with pkgs; [
      gnome-control-center
      wlsunset
      hyprlock
    ];
    gtk.enable = true;
    home.stateVersion = "24.05";
  };
}
