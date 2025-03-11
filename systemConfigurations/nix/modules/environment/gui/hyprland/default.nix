# hyprland/default.nix
#
{
  imports = [
    ./ags.nix
    ./hyprland.nix
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
