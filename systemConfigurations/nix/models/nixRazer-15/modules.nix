# nixRazer-15/modules.nix
#
{
  imports = [
    ../../modules/hosts/x86Laptop

    ../../modules/drivers/nvidia
    ../../modules/drivers/razer

    ../../modules/environment/shell/zsh

    ../../modules/environment/gui/general
    ../../modules/environment/gui/hyprland

    ../../modules/applications/creativity/krita

    ../../modules/applications/development/git
    ../../modules/applications/development/haskell

    ../../modules/applications/editing/libreOffice
    ../../modules/applications/editing/nvim
    ../../modules/applications/editing/tex

    ../../modules/applications/gaming/steam

    ../../modules/applications/internet/discord
    ../../modules/applications/internet/onedrive
    ../../modules/applications/internet/zoom
    ../../modules/applications/internet/zen

    ../../modules/applications/media/mpv
    ../../modules/applications/media/you-get

    ../../modules/applications/security/1Password
    ../../modules/applications/security/adGuardHome

    ../../modules/applications/tools/basic
    ../../modules/applications/tools/kitty
    ../../modules/applications/tools/nemo
    ../../modules/applications/tools/starship
    ../../modules/applications/tools/yazi
    ../../modules/applications/tools/llama-cpp

    ../../modules/applications/virtualisation/virtualBox
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
