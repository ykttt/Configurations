# peazip/default.nix
#
{sysinfo, ...}: {
  home-manager.users.${sysinfo.target} = {pkgs, ...}: {
    home.packages = [pkgs.peazip];
    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "application/zip" = "peazip-extract.desktop";
        "application/x-7z-compressed" = "peazip-extract.desktop";
        "application/x-rar" = "peazip-extract.desktop";
        "application/x-tar" = "peazip-extract.desktop";
        "application/gzip" = "peazip-extract.desktop";
        "application/x-xz" = "peazip-extract.desktop";
        "application/zstd" = "peazip-extract.desktop";
      };
    };
  };
}
