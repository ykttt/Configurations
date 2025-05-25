# hyprland/hyprpanel.nix
#
{
  lib,
  config,
  sysinfo,
  ...
}: let
  pywal = true;
  hypr = config.programs.hyprland;
in
  with lib; {
    home-manager.users.${sysinfo.target} = {pkgs, ...}: {
      catppuccin.kitty.enable = mkIf pywal (mkForce false);
      programs.kitty.settings.include = mkIf pywal "~/.cache/wal/colors-kitty.conf";
      home.packages = with pkgs; [
        slurp
        wayshot
        libnotify
        hyprpanel
      ];
      wayland.windowManager.hyprland.settings = with lib;
        mkIf hypr.enable {
          exec-once = ["hyprpanel &"];
        };
    };
  }
