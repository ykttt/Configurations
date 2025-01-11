# hyprland/nm-applet.nix
#
{
  home-manager.users.km = {
    inputs,
    pkgs,
    ...
  }: {
    home.packages = [pkgs.networkmanagerapplet];
    services.network-manager-applet.enable = true;
    home.stateVersion = "24.05";
  };
}
