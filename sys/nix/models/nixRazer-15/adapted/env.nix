# modules/env.nix
#
{
  imports = [
    ../../../modules/env/nix
    ../../../modules/env/security
    ../../../modules/env/shell/nushell
    ../../../modules/env/gui/general
    ../../../modules/env/gui/hyprland
    ../../../modules/env/virtualisation/virt-manager
  ];
}
