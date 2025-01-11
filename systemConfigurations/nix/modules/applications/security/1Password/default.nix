# 1Password/default.nix
#
{
  programs = {
    _1password = {enable = true;};
    _1password-gui = {
      enable = true;
      polkitPolicyOwners = ["km"];
    };
  };
}
