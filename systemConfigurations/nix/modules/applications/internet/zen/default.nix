# zen/default.nix
#
{
  pkgs,
  inputs,
  sysinfo,
  ...
}: {
  home-manager.users.${sysinfo.target}.home.packages = [inputs.zen-browser.packages."${pkgs.system}".default];
}
