

# virtualBox/default.nix

{
   virtualisation.virtualbox.host.enable = true;
   users.extraGroups.vboxusers.members = [ "km" ];
}
