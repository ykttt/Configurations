# onedrive/default.nix
#
{sysinfo, ...}: {
  home-manager.users.${sysinfo.target} = {pkgs, ...}: {
    home.packages = with pkgs; [
      # onedrive
      ver24-11.onedrive
    ];
  };
}
