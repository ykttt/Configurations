# hyprland/animations.nix
#
{sysinfo, ...}: {
  home-manager.users.${sysinfo.target}.wayland.windowManager.hyprland.settings.animations = {
    enabled = true;
    bezier = [
      "basic, 0.05, 0.9, 0.1, 1.05"
    ];
    animation = [
      "windows, 1, 5, basic"
      "windowsOut, 1, 5, default, popin 80%"
      "border, 1, 8, default"
      "borderangle, 1, 6, default"
      "fade, 1, 5, default"
      "workspaces, 1, 4, default"
    ];
  };
}
