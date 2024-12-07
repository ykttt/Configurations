

# basic/oth.nix

{
  home-manager.users.km = {
    pkgs,
    inputs,
    ...
  }: {
    home.packages = with pkgs; [
      gcc
      w3m
      ver24-11.onedrive
      discord
      thunderbird
    ];
    home.stateVersion = "24.05";
  };
}
