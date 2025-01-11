# hyprland/envs.nix
#
{
  home-manager.users.km = {pkgs, ...}: {
    wayland.windowManager.hyprland.settings.env = [
      "GDK_SCALE,2"
      "XCURSOR_SIZE,20"
      "HYPRCURSOR_SIZE,24"
    ];
    home.stateVersion = "24.05";
  };
}
