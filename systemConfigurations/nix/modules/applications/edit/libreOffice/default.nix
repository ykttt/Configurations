

# libreOffice/default.nix

{
  home-manager.users.km = {
    pkgs,
    ...
  }: {
    home.packages = with pkgs; [ libreoffice ];
    home.stateVersion = "24.05";
  };
}
