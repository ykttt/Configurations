# thunar/default.nix
#
{
  pkgs,
  sysinfo,
  ...
}: {
  security.polkit.enable = true;
  services = {
    tumbler.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
  };
  environment = {
    systemPackages = with pkgs; [
      gdk-pixbuf # image
      ffmpeg-headless
      ffmpegthumbnailer # video
      librsvg # SVG
      poppler-utils # PDF
      libheif
      libheif.out # HEIF/AVIF
    ];
    pathsToLink = ["share/thumbnailers"];
    sessionVariables.GIO_EXTRA_MODULES = with pkgs;
      lib.mkForce
      "${gvfs}/lib/gio/modules:${glib-networking}/lib/gio/modules";
  };
  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      thunar-archive-plugin
      thunar-volman
      thunar-vcs-plugin
    ];
  };
  home-manager.users.${sysinfo.target} = {pkgs, ...}: {
    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "inode/directory" = ["thunar.desktop"];
        "application/x-directory" = ["thunar.desktop"];
      };
    };
  };
}
