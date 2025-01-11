# general/catppuccin.nix
#
{
  home-manager.users.km = {inputs, ...}: {
    imports = [
      inputs.catppuccin.homeManagerModules.catppuccin
    ];
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

    home.stateVersion = "24.05";
  };
}
