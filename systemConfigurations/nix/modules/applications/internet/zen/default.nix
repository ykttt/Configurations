# zen/default.nix
#
{sysinfo, ...}: {
  home-manager.users.${sysinfo.target} = {
    pkgs,
    inputs,
    ...
  }: {
    home.packages = [inputs.zen-browser.packages."${pkgs.system}".default];
  };
}
