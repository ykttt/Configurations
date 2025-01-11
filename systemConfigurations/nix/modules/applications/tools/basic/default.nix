# tools/basic.nix
#
{
  home-manager.users.km = {pkgs, ...}: {
    home.packages = with pkgs; [
      gcc
      unzip
      gnumake
    ];
    home.stateVersion = "24.05";
  };
}
