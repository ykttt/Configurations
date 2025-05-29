# ../modules/env.nix
#
{
  imports = [
    ../../../modules/environment/nixConfig
    ../../../modules/environment/security
    ../../../modules/environment/shell/zsh
    ../../../modules/environment/gui/general
    ../../../modules/environment/gui/gnome
  ];
}
