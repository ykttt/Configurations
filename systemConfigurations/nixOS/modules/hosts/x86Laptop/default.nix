

# x86Laptop/default.nix

{
  imports = [
    ./boot.nix
    ./hardware.nix
    ./i18n.nix
    ./network.nix
    ./nixConfig.nix
    ./security.nix
  ];
}
