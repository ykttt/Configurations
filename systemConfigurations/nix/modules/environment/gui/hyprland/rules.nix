# hyprland/rules.nix
#
{sysinfo, ...}: {
  home-manager.users.${sysinfo.target}.wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      "float,title:^(Picture-in-Picture)$"
      "syncfullscreen on,workspace:11"
      "workspace 11,class:steam,title:Steam Big Pictureモード"
      "tile,class:steam,title:Steam Big Pictureモード"
      "opacity 0.5 0.5,class:^(BongoCat\\.exe)$"
    ];
    workspace = [
      "11,border:false,rounding:false,decorate:false,gapsin:0,gapsout:0,border:false,on-created-empty:steam"
    ];
  };
}
