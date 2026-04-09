# rofi/default.nix
#
{
  lib,
  config,
  sysinfo,
  ...
}:
with config; let
  kitty = home-manager.users.${sysinfo.target}.programs.kitty;
in {
  home-manager.users.${sysinfo.target} = {
    pkgs,
    inputs,
    ...
  }: {
    wayland.windowManager.hyprland.settings = {
      "$drunmenu" = lib.mkForce "rofi -show combi";
      "$filemenu" = lib.mkForce "rofi -show recursivebrowser";
    };
    programs.rofi = {
      enable = true;
      font = "Sarasa Mono J 15";
      location = "center";
      modes = [
        "combi"
        "drun"
        "keys"
        "run"
        "recursivebrowser"
        "ssh"
        "window"
      ];
      terminal = with lib; mkIf kitty.enable (mkForce "kitty");
      theme = ./theme.rasi;
      extraConfig = {
        combi-modes = [
          "window"
          "drun"
          "run"
          "recursivebrowser"
          "ssh"
          "keys"
        ];
      };
    };
  };
}
