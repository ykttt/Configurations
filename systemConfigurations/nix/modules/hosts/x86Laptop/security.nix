# x86Laptop/security.nix
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
