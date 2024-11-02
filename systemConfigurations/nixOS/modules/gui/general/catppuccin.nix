

# general/catppuccin.nix

{
  home-manager.users.km = {
    inputs,
    ...
  }: {
    imports = [
      inputs.catppuccin.homeManagerModules.catppuccin
    ];
    catppuccin = {
      enable = true;
      flavor = "mocha";
      accent = "teal";
      pointerCursor = {
        enable = true;
        accent = "dark";
      };
    };
    gtk.catppuccin = {
      enable = true;
      icon.enable = true;
      gnomeShellTheme = true;
      size = "compact";
    };
    programs.neovim.catppuccin.enable = false;
    home.stateVersion = "24.05";
  };
}
