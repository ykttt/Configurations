# general/catppuccin.nix
#
{sysinfo, ...}: {
  home-manager.users.${sysinfo.target} = {inputs, ...}: {
    imports = [inputs.catppuccin.homeModules.catppuccin];
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
    };
  };
}
