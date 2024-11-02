

# x86Laptop/boot.nix

{
  boot = {
    kernelParams = [ "acpi=force" ];
    plymouth.enable = true;
    tmp = {
      cleanOnBoot = true;
      useTmpfs = true;
      tmpfsSize = "60%";
    };
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 0;  # Spam space to get into boot menu
    };
  };
}
