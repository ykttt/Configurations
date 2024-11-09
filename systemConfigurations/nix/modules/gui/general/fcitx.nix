

# general/fcitx.nix

{
  pkgs,
  ...
}: {
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        fcitx5-gtk
        fcitx5-mozc
      ];
    };
  };
  environment.sessionVariables = {
    QT_IM_MODULE = "fcitx";
    # GTK_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
  };
}
