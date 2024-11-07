

# basic/oth.nix

{
  home-manager.users.km = {
    pkgs,
    ...
  }: {
    home.packages = with pkgs; [
      gcc
      w3m
      mpv
      discord
      onedrive
      pciutils
      thunderbird
    ];
    home.stateVersion = "24.05";
  };
}
