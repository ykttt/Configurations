# yazi/default.nix
#
{
  home-manager.users.km = {pkgs, ...}: {
    programs.yazi = {
      enable = true;
      enableZshIntegration = true;
    };
    home.stateVersion = "24.05";
  };
}
