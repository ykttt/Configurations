# nixRazer-15/modules.nix
#
{
  imports =
    [../../modules/hosts/x86Laptop]
    ++ (with ../../modules/drivers; [
      nvidia
      razer
    ])
    ++ (with ../../modules/environment/shell; [
      zsh
    ])
    ++ (with ../../modules/environment/gui; [
      general
      hyprland
    ])
    ++ (with ../../modules/applications/tools; [
      basic
      kitty
      nemo
      yazi
    ])
    ++ (with ../../modules/applications/development; [
      git
      haskell
    ])
    ++ (with ../../modules/applications/editing; [
      libreOffice
      nvim
      tex
    ])
    ++ (with ../../modules/applications/media; [
      mpv
      you-get
    ])
    ++ (with ../../modules/applications/creativity; [
      krita
    ])
    ++ (with ../../modules/applications/internet; [
      onedrive
      discord
      zoom
      zen
    ])
    ++ (with ../../modules/applications/security; [
      adGuardHome
      onePassword
    ])
    ++ (with ../../modules/applications/gaming; [
      steam
    ])
    ++ (with ../../modules/applications/virtualisation; [
      virtualBox
    ]);
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
