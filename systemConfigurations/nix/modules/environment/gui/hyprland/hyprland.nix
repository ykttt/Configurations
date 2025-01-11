# hyprland/hyprland.nix
#
{pkgs, ...}: {
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
    extraPortals = [pkgs.xdg-desktop-portal-hyprland];
  };
  home-manager.users.km = {pkgs, ...}: {
    home.packages = with pkgs; [
      wlsunset
      hyprlock
    ];
    gtk.enable = true;
    home.stateVersion = "24.05";
  };
}
