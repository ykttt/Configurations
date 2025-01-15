# 1Password/default.nix
#
{sysinfo, ...}: {
  programs = {
    _1password.enable = true;
    _1password-gui = {
      enable = true;
      polkitPolicyOwners = [sysinfo.target];
    };
  };
}
