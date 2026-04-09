# obs-studio/default.nix
#
{sysinfo, ...}: {
  home-manager.users.${sysinfo.target} = {pkgs, ...}: {
    home.packages = with pkgs; [
      obs-studio
      v4l-utils
      usbutils
      xorg.xset
    ];
  };
}
