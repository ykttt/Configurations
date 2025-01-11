# hyprland/windowRules.nix
#
{
  home-manager.users.km = {pkgs, ...}: {
    wayland.windowManager.hyprland.settings.windowrulev2 = [
      "float,title:^(Picture-in-Picture)$"
      "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
    ];
    home.stateVersion = "24.05";
  };
}
