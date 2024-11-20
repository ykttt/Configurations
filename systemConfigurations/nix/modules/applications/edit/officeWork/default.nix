

# officeWork/default.nix

{
  home-manager.users.km = {
    pkgs,
    ...
  }: {
    home.packages = with pkgs; [
      libreoffice
      unzip
    ];
    home.stateVersion = "24.05";
  };
}
