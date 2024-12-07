

# krita/default.nix

{
  home-manager.users.km = {
    pkgs,
    ...
  }: {
    home.packages = [ pkgs.krita ];
    home.stateVersion = "24.05";
  };
}
