# onedrive/default.nix
#
{
  home-manager.users.km = {pkgs, ...}: {
    home.packages = with pkgs; [
      # onedrive
      ver24-11.onedrive
    ];
    home.stateVersion = "24.05";
  };
}
