# wezterm/default.nix
#
{
  home-manager.users.km = {
    pkgs,
    input,
    ...
  }: {
    programs.wezterm = {
      enable = true;
      package = input.wezterm.packages.${pkgs.system}.default;
      enableZshIntegration = true;
    };
    home.stateVersion = "24.05";
  };
}
