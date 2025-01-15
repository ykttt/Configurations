# /modules/default.nix
#
{
  imports = [
    ./basic.nix
    ./boot.nix
    ./hardware.nix
    ./i18n.nix
    ./network.nix
    ./services.nix
  ];
}
