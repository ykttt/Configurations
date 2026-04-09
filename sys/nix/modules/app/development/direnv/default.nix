# direnv/default.nix
#
{sysinfo, ...}: {
  home-manager.users.${sysinfo.target} = {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
