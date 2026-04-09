# yazi/default.nix
#
{sysinfo, ...}: {
  home-manager.users.${sysinfo.target}.programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };
}
