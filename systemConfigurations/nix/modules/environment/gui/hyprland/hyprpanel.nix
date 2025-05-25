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
          bind = [
            ", XF86PowerOff,  exec, hyprpanel t powerdropdownmenu"
            "Shift, Print, exec, ~/repositories/configurations/generalScripts/general/screenshot.sh full"
            ", Print, exec, ~/repositories/configurations/generalScripts/general/screenshot.sh area"
          ];
        };
    };
  }
