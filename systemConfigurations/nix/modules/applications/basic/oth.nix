

# basic/oth.nix

{
  home-manager.users.km = {
    pkgs,
    ...
  }: {
    home.packages = with pkgs; [
      gcc
      w3m
      discord
      ver24-11.onedrive
      onedrive
      thunderbird
    ];
    home.stateVersion = "24.05";
  };
}
