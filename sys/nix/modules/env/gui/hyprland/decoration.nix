# hyprland/decorations.nix
#
{sysinfo, ...}: {
  home-manager.users.${sysinfo.target}.wayland.windowManager.hyprland.settings.decoration = {
    rounding = 15;
    active_opacity = 1.0;
    dim_around = 0.35;
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
      new_optimizations = true;
      ignore_opacity = true;
      vibrancy = 0.1696;
    };
  };
}
