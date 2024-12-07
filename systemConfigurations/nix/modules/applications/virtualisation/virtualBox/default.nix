

# virtualBox/default.nix

{
  virtualisation.virtualbox.host = {
    enable = true;
    enableKvm = true;
    addNetworkInterface = false;
    enableExtensionPack = true;
  };
  users.extraGroups.vboxusers.members = [ "km" ];
}
