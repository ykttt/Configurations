# hyprland/hyprland.nix
#
{
  pkgs,
  sysinfo,
  ...
}: {
  services = {
    power-profiles-daemon.enable = true;
    logind.settings.Login.HandlePowerKey = "ignore";
  };
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-hyprland];
  };
  home-manager.users.${sysinfo.target} = {
    pkgs,
    inputs,
    ...
  }: {
    imports = [
      inputs.hyprcursor-phinger.homeManagerModules.hyprcursor-phinger
    ];
    home.packages = with pkgs; [
      kitty
      hyprlock
      playerctl
      hyprsunset
      pwvucontrol
      wl-clipboard
      brightnessctl
    ];
    wayland.windowManager.hyprland = {
      enable = true;
      plugins = with pkgs.hyprlandPlugins; [
        # hypr-dynamic-cursors
      ];
    };
    programs.hyprcursor-phinger.enable = true;
    gtk.enable = true;
  };
}
