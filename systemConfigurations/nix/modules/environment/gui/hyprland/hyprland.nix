# hyprland/hyprland.nix
#
{
  pkgs,
  sysinfo,
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
    extraPortals = [pkgs.xdg-desktop-portal-hyprland];
  };
  home-manager.users.${sysinfo.target} = {pkgs, ...}: {
    home.packages = with pkgs; [
      wlsunset
      hyprlock
    ];
    wayland.windowManager.hyprland.enable = true;
    gtk.enable = true;
    home.stateVersion = "24.05";
  };
}
