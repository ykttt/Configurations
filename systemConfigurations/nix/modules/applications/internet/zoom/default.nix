# zen/default.nix
#
{
  home-manager.users.km = {pkgs, ...}: {
    home.packages = [pkgs.zoom-us];
    home.stateVersion = "24.05";
  };
}
