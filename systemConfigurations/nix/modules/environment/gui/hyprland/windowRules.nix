# hyprland/windowRules.nix
#
{sysinfo, ...}: {
  home-manager.users.${sysinfo.target}.wayland.windowManager.hyprland.settings.windowrulev2 = [
    "float,title:^(Picture-in-Picture)$"
    "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
  ];
}
