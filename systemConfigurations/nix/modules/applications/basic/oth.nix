

# basic/oth.nix

{
  home-manager.users.km = {
    pkgs,
    ...
  }: {
    home.packages = with pkgs; [
      gcc
      w3m
      unzip
      discord
      thunderbird
      ver24-11.onedrive
    ];
    home.stateVersion = "24.05";
  };
}
