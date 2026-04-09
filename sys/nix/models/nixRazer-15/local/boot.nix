# hardware/boot.nix
#
{pkgs, ...}: {
  boot = {
    # kernelParams = ["acpi=force"];
    # kernelPackages = pkgs.linuxPackages_latest;
    kernelPackages = pkgs.linuxPackages_zen;
    plymouth.enable = true;
    tmp = {
      cleanOnBoot = true;
      useTmpfs = true;
      tmpfsSize = "60%";
    };
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 0; # Spam space to get into boot menu
    };
  };
}
