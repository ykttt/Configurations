# kitty/default.nix
#
{sysinfo, ...}: {
  imports = [
    ./keybindings.nix
    ./settings.nix
  ];
  home-manager.users.${sysinfo.target}.programs.kitty.enable = true;
}
