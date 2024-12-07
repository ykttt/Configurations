

# nixRazer-15/modules.nix

{
  imports = [
    ../../modules/hosts/x86Laptop

    ../../modules/drivers/razer
    ../../modules/drivers/nvidia

    ../../modules/gui/general
    ../../modules/gui/hyprland

    ../../modules/applications/basic

    ../../modules/applications/development/git

    ../../modules/applications/edit/krita
    # ../../modules/applications/edit/libreOffice
    # ../../modules/applications/edit/emacs
    ../../modules/applications/edit/nvim
    ../../modules/applications/edit/tex

    ../../modules/applications/gaming/steam
    # ../../modules/applications/gaming/aagl

    ../../modules/applications/network/zoom
    ../../modules/applications/network/zen

    # ../../modules/applications/scholar/matlabImpure

    ../../modules/applications/virtualisation/virtualBox

    ../../modules/applications/security/adGuardHome
    ../../modules/applications/security/1Password

  ];
  networking.hostName = "nixRazer-15";
  users = {
    users.km = {
      isNormalUser = true;
      description = "km";
      extraGroups = [
        "networkmanager"
        "wheel"
        "openrazer"
      ];
    };
  };
  system.stateVersion = "24.05";
}
