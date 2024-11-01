#
#
#	krita/default.nix
#

{ inputs, config, pkgs, lib, options, ... }:
{
        home-manager.users.km = { inputs, pkgs, ... }: {
	        home.packages = [ pkgs.krita ];
	        home.stateVersion = "24.05";
        };
}
