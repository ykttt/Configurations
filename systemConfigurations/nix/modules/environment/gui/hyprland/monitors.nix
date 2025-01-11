# hyprland/monitors.nix
#
{
  home-manager.users.km = {pkgs, ...}: {
    wayland.windowManager.hyprland.settings.monitor = [
      ",preferred,auto,auto"
    ];
    home.stateVersion = "24.05";
  };
}
