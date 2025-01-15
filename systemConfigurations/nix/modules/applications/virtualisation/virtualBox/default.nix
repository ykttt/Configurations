# virtualBox/default.nix
#
{sysinfo, ...}: {
  virtualisation.virtualbox.host = {
    enable = true;
    enableKvm = true;
    addNetworkInterface = false;
    enableExtensionPack = true;
  };
  users.extraGroups.vboxusers.members = [sysinfo.target];
}
