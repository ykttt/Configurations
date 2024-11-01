#
#
#	hyprland/nm-applet.nix
#

{ inputs, config, pkgs, lib, options, ... }:
{
        home-manager.users.km = { inputs, pkgs, ... }: {
                home.package = [ pkgs.networkmanagerapplet ];
                services.network-manager-applet.enable = true;
	        home.stateVersion = "24.05";
        };
}
