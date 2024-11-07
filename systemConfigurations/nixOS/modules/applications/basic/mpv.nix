

# basic/mpv.nix

{
  home-manager.users.km = {
    pkgs,
    ...
  }: {
    home.packages = [ pkgs.mpv ];
    xdg = {
      desktopEntries.mpv-img = {
        name = "mpv-img";
        comment = "View images";
        icon = "mpv";
        type = "Application";
        exec = "mpv --config-dir=/home/km/.config/mpv/imgView --player-operation-mode=pseudo-gui";
        terminal = false;
      };
      mimeApps = {
        enable = true;
        defaultApplications = {
          "image/jpeg" = "mpv-img.desktop";
          "image/png" = "mpv-img.desktop";
        };
      };
    };
    home.stateVersion = "24.05";
  };
}
