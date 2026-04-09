# aagl/default.nix
#
{inputs, ...}: {
  imports = [inputs.aagl.nixosModules.default];
  nix.settings = inputs.aagl.nixConfig; # Set up Cachix
  programs.anime-games-launcher.enable = true;
}
