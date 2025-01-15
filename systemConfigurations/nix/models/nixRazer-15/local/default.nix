# /modules/default.nix
#
{
  imports = [
    ./basic.nix
    ./boot.nix
    ./devices.nix
    ./i18n.nix
    ./network.nix
    ./services.nix
  ];
}
