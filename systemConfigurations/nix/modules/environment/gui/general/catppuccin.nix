# general/catppuccin.nix
#
{
  inputs,
  sysinfo,
  ...
}: {
  imports = [inputs.catppuccin.homeManagerModules.catppuccin];
  home-manager.users.${sysinfo.target}.catppuccin = {
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
  };
}
