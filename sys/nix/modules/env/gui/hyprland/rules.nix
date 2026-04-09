# hyprland/rules.nix
#
{sysinfo, ...}: {
  home-manager.users.${sysinfo.target}.wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      "pin,title:^(Picture-in-Picture)$"

      "float,title:^(Picture-in-Picture)$"
      "float,title:^(Extension: )$"
      "float,class:^(steam_app_)$"
      "float,class:steam"
      "float,class:Thunar"
      "float,class:peazip"

      "size 1200 700, class:Thunar"
      "size 1000 600, class:peazip"

      "noblur,title:^(Picture-in-Picture)$"
      "noborder,title:^(Picture-in-Picture)$"

      "opacity 1.0 0.7,title:^(Picture-in-Picture)$"
      "opacity 0.9 0.9,class:neovide"
    ];
    layerrule = [
      "blur on,dim_around on,ignore_alpha 0.15,match:namespace rofi"
    ];
    workspace = [
      # "11,border:false,rounding:false,decorate:false,gapsin:0,gapsout:0,border:false,on-created-empty:steam"
    ];
  };
}
