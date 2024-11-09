

# aagl/default.nix

{
  home-manager.users.km = {
    inputs,
    pkgs,
    ...
  }: {
    imports = [ inputs.aagl.nixosModules.default ];
    nix.settings = inputs.aagl.nixConfig; # Set up Cachix
    programs.anime-games-launcher.enable = true;
    home.stateVersion = "24.05";
  };
}
