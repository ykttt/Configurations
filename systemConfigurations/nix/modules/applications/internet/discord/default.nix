# discord/default.nix
#
{
  home-manager.users.km = {pkgs, ...}: {
    home.packages = [pkgs.discord];
    home.stateVersion = "24.05";
  };
}
