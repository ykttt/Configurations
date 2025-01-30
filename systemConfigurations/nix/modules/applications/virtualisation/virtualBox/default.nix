# virtualBox/default.nix
#
{
  pkgs,
  sysinfo,
  ...
}: {
  virtualisation.virtualbox.host = {
    package = pkgs.ver24-11.virtualbox;
    enable = true;
    enableKvm = true;
    addNetworkInterface = false;
    enableExtensionPack = true;
  };
  users.extraGroups.vboxusers.members = [sysinfo.target];
}
