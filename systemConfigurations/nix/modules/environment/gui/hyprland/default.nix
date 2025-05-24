# hyprland/default.nix
#
{
  imports = [
    ./hyprland.nix
    ./hyprpanel.nix
    ./envs.nix
    ./monitors.nix
    ./autoStart.nix
    ./decoration.nix
    ./animations.nix
    ./keybindings.nix
    ./rules.nix
    ./preferences.nix
  ];
}
