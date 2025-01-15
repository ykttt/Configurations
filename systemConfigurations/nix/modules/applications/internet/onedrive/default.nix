# onedrive/default.nix
#
{
  pkgs,
  sysinfo,
  ...
}: {
  home-manager.users.${sysinfo.target}.home.packages = with pkgs; [
    # onedrive
    ver24-11.onedrive
  ];
}
