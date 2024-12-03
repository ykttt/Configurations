

# basic/oth.nix

{
  home-manager.users.km = {
    pkgs,
    # pkgsStable,
    ...
  }: {
    home.packages = with pkgs; [
      gcc
      w3m
      discord
      # pkgsStable.onedrive
      onedrive
      thunderbird
    ];
    home.stateVersion = "24.05";
  };
}
