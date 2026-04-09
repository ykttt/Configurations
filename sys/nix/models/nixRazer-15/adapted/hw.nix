# modules/hw.nix
#
{
  imports = [
    ../../../modules/hw/nvidia
    ../../../modules/hw/razer
    ../../../modules/hw/bluetooth
    ../../../modules/hw/network
    ../../../modules/hw/x86LaptopMisc
  ];
}
