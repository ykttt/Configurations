

# steam/default.nix

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };
  home-manager.users.km = {
    pkgs,
    ...
  }: {
    # home.packages = [ pkgs.adwsteamgtk ];
    home.stateVersion = "24.05";
  };
}
