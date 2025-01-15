# security/default.nix
#
{
  security = {
    sudo = {
      enable = true;
      wheelNeedsPassword = false;
    };
    rtkit.enable = true;
  };
}
