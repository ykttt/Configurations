# hyprland/envs.nix
#
{sysinfo, ...}: {
  home-manager.users.${sysinfo.target}.wayland.windowManager.hyprland.settings.env = [
    "XCURSOR_SIZE,24"
    "HYPRCURSOR_SIZE,24"
    "HYPRCURSOR_THEME,phinger-cursors-dark-hyprcursor"
  ];
}
