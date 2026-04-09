# niri/default.nix
#
{
  pkgs,
  sysinfo,
  inputs,
  ...
}: {
  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };
  services = {
    power-profiles-daemon.enable = true;
    logind.settings.Login.HandlePowerKey = "ignore";
    displayManager.sessionPackages = [pkgs.niri];
  };
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal];
  };
  home-manager.users.${sysinfo.target} = {pkgs, ...}: {
    imports = [inputs.niri.homeModules.niri ./preferences.nix ./keybindings.nix ./rules.nix];
    programs.niri = {
      enable = true;
      package = pkgs.niri;
    };
    home.packages = with pkgs; [
      kitty
      wlsunset
      hyprlock
      pwvucontrol
      wl-clipboard
      brightnessctl
    ];
    gtk.enable = true;
  };
}
