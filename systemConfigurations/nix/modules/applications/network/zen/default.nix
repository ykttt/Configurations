# zen/default.nix
#
{
  home-manager.users.km = {
    inputs,
    pkgs,
    ...
  }: {
    home.packages = [inputs.zen-browser.packages."${pkgs.system}".specific];
    home.stateVersion = "24.05";
  };
}
