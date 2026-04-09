# general/fcitx.nix
#
{
  lib,
  pkgs,
  config,
  ...
}: {
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = lib.mkIf config.programs.hyprland.enable true;
      addons = with pkgs; [
        fcitx5-gtk
        fcitx5-mozc
        fcitx5-skk
        fcitx5-rime
        fcitx5-fluent
      ];
    };
  };
  environment.sessionVariables = {
    QT_IM_MODULE = "fcitx";
    # GTK_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
  };
}
