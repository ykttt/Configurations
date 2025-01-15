# hyprland/monitors.nix
#
{sysinfo, ...}: {
  home-manager.users.${sysinfo.target}.wayland.windowManager.hyprland.settings.monitor = [
    ",preferred,auto,auto"
  ];
}
