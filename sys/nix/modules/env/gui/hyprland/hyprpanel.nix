# hyprland/hyprpanel.nix
#
{
  lib,
  config,
  sysinfo,
  ...
}:
with lib; {
  home-manager.users.${sysinfo.target} = {pkgs, ...}: {
    home.packages = with pkgs; [
      slurp
      wayshot
      libnotify
      hyprpanel
    ];
    wayland.windowManager.hyprland.settings = with lib;
      mkIf config.programs.hyprland.enable {
        exec-once = ["hyprpanel &"];
        bind = [
          ", XF86PowerOff,  exec, hyprpanel t powerdropdownmenu"
          "Shift, Print, exec, ~/repositories/configurations/generalScripts/general/screenshot.sh full"
          ", Print, exec, ~/repositories/configurations/generalScripts/general/screenshot.sh area"
        ];
      };
  };
}
