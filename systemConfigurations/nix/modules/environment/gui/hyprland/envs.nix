# hyprland/envs.nix
#
{sysinfo, ...}: {
  home-manager.users.${sysinfo.target}.wayland.windowManager.hyprland.settings.env = [
    "GDK_SCALE,2"
    "XCURSOR_SIZE,24"
    "HYPRCURSOR_SIZE,24"
  ];
}
