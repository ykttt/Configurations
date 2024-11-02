

# zen/default.nix

{
  home-manager.users.km = {
    pkgs,
    ...
  }: {
    nixpkgs.config.allowUnfree = true;
    home.packages = [ pkgs.zoom-us ];
    home.stateVersion = "24.05";
  };
}
