# you-get/default.nix
#
{
  home-manager.users.km = {pkgs, ...}: {
    home.packages = [pkgs.you-get];
    home.stateVersion = "24.05";
  };
}
