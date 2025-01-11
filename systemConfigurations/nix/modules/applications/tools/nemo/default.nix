# yazi/default.nix
#
{
  home-manager.users.km = {pkgs, ...}: {
    home.packages = [pkgs.nemo];
    home.stateVersion = "24.05";
  };
}
