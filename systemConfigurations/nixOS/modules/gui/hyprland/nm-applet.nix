#
#
#	hyprland/nm-applet.nix
#

{ inputs, config, pkgs, lib, options, ... }:
{
	imports = [ <home-manager/nixos> ];
        home-manager.users.km = { inputs, pkgs, ... }: {
                home.package = [ pkgs.networkmanagerapplet ];
                services.network-manager-applet.enable = true;
	        home.stateVersion = "24.05";
        };
}
