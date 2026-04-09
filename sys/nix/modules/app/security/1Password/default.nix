# 1Password/default.nix
#
{sysinfo, ...}: {
  environment.etc = {
    "1password/custom_allowed_browsers" = {
      text = ''
        zen
        vivaldi-bin
      '';
      mode = "0755";
    };
  };
  programs = {
    _1password.enable = true;
    _1password-gui = {
      enable = true;
      polkitPolicyOwners = [sysinfo.target];
    };
  };
}
