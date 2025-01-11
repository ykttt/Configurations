# hyprland/decorations.nix
#
{
  home-manager.users.km = {pkgs, ...}: {
    wayland.windowManager.hyprland.settings.decoration = {
      rounding = 15;
      active_opacity = 1.0;
      inactive_opacity = 1.0;
      fullscreen_opacity = 1.0;
      shadow = {
        enabled = true;
        range = 5;
        sharp = false;
      };
      blur = {
        enabled = true;
        size = 8;
        passes = 3;
        noise = 0.02;
        new_optimizations = "on";
        vibrancy = 0.1696;
      };
    };
    home.stateVersion = "24.05";
  };
}
