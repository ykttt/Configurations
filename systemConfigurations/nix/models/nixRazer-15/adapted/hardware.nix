# /modules/default.nix
#
{
  imports = [
    ../../../modules/hardware/nvidia
    ../../../modules/hardware/razer
    ../../../modules/hardware/bluetooth
    ../../../modules/hardware/network
    ../../../modules/hardware/x86LaptopMisc
  ];
}
