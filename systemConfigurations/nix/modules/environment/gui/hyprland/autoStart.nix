# hyprland/autoStart.nix
#
{
  home-manager.users.km = {pkgs, ...}: {
    wayland.windowManager.hyprland.settings.exec-once = [
      "sudo ~/repositories/configurations/generalScripts/loginScripts/razer-sndfix/razer-sndfix.sh &"
      "swww-daemon &"
      "ags &"
      "nm-applet &"
      "fcitx5 -d"
      "1password %U"
    ];
    home.stateVersion = "24.05";
  };
}
