# general/catppuccin.nix
#
{
  lib,
  config,
  sysinfo,
  ...
}:
with lib; let
  isGnome = config.services.desktopManager.gnome.enable;
in {
  home-manager.users.${sysinfo.target} = {inputs, ...}: {
    imports = [inputs.catppuccin.homeModules.catppuccin];
    gtk = {
      enable = mkIf isGnome true;
      catppuccin.enable = mkIf isGnome true;
    };
    catppuccin = {
      enable = true;
      flavor = "mocha";
      accent = "teal";
      cursors = {
        enable = true;
        accent = "dark";
      };
      gtk = {
        enable = true;
        icon.enable = true;
        gnomeShellTheme = true;
        size = "compact";
      };
      nvim.enable = false;
      mako.enable = false;
    };
  };
}
