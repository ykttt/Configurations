# mpv/default.nix
#
{
  pkgs,
  sysinfo,
  ...
}: {
  home-manager.users.${sysinfo.target} = {
    home.packages = [pkgs.mpv];
    xdg = {
      desktopEntries.mpv-img = {
        name = "mpv-img";
        comment = "View images";
        categories = ["Graphics"];
        icon = "mpv";
        type = "Application";
        exec = "mpv --config-dir=/home/km/.config/mpv/imgView --player-operation-mode=pseudo-gui";
        terminal = false;
      };
      mimeApps = {
        associations.added = {
          "audio/aac" = "mpv.desktop";
          "audio/mp4" = "mpv.desktop";
          "audio/mpeg" = "mpv.desktop";
          "audio/mpegurl" = "mpv.desktop";
          "audio/ogg" = "mpv.desktop";
          "audio/vnd.rn-realaudio" = "mpv.desktop";
          "audio/vorbis" = "mpv.desktop";
          "audio/x-flac" = "mpv.desktop";
          "audio/x-mp3" = "mpv.desktop";
          "audio/x-mpegurl" = "mpv.desktop";
          "audio/x-ms-wma" = "mpv.desktop";
          "audio/x-musepack" = "mpv.desktop";
          "audio/x-oggflac" = "mpv.desktop";
          "audio/x-pn-realaudio" = "mpv.desktop";
          "audio/x-scpls" = "mpv.desktop";
          "audio/x-speex" = "mpv.desktop";
          "audio/x-vorbis" = "mpv.desktop";
          "audio/x-vorbis+ogg" = "mpv.desktop";
          "audio/x-wav" = "mpv.desktop";
          "image/avif" = "mpv-img.desktop";
          "image/bmp" = "mpv-img.desktop";
          "image/heif" = "mpv-img.desktop";
          "image/jpeg" = "mpv-img.desktop";
          "image/pjpeg" = "mpv-img.desktop";
          "image/png" = "mpv-img.desktop";
          "image/webp" = "mpv-img.desktop";
          "image/x-icns" = "mpv-img.desktop";
        };
        defaultApplications = {
          "audio/aac" = "mpv.desktop";
          "audio/mp4" = "mpv.desktop";
          "audio/mpeg" = "mpv.desktop";
          "audio/mpegurl" = "mpv.desktop";
          "audio/ogg" = "mpv.desktop";
          "audio/vnd.rn-realaudio" = "mpv.desktop";
          "audio/vorbis" = "mpv.desktop";
          "audio/x-flac" = "mpv.desktop";
          "audio/x-mp3" = "mpv.desktop";
          "audio/x-mpegurl" = "mpv.desktop";
          "audio/x-ms-wma" = "mpv.desktop";
          "audio/x-musepack" = "mpv.desktop";
          "audio/x-oggflac" = "mpv.desktop";
          "audio/x-pn-realaudio" = "mpv.desktop";
          "audio/x-scpls" = "mpv.desktop";
          "audio/x-speex" = "mpv.desktop";
          "audio/x-vorbis" = "mpv.desktop";
          "audio/x-vorbis+ogg" = "mpv.desktop";
          "audio/x-wav" = "mpv.desktop";
          "image/avif" = "mpv-img.desktop";
          "image/bmp" = "mpv-img.desktop";
          "image/heif" = "mpv-img.desktop";
          "image/jpeg" = "mpv-img.desktop";
          "image/pjpeg" = "mpv-img.desktop";
          "image/png" = "mpv-img.desktop";
          "image/webp" = "mpv-img.desktop";
          "image/x-icns" = "mpv-img.desktop";
        };
      };
    };
  };
}
