# wezterm/default.nix
#
{
  home-manager.users.km = {
    pkgs,
    inputs,
    ...
  }: {
    programs.wezterm = {
      enable = true;
      package = inputs.wezterm.packages.${pkgs.system}.default;
      enableZshIntegration = true;
    };
    home.stateVersion = "24.05";
  };
}
