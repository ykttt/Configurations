

# onlyOffice/default.nix

{
  home-manager.users.km = {
    pkgs,
    ...
  }: {
    home.packages = [ pkgs.onlyoffice-desktopeditors ];
    home.stateVersion = "24.05";
  };
}
