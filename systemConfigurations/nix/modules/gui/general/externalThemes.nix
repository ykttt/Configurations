# general/externalThemes.nix
#
{
  home-manager.users.km = {pkgs, ...}: {
    home.packages = [pkgs.nwg-look];
    # programs.kitty.themeFile = "Nord";
    home.stateVersion = "24.05";
  };
}
