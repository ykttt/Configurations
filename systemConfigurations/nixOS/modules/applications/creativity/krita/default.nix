#
#
#	krita/default.nix
#

{ inputs, config, pkgs, lib, options, ... }:
{
	imports = [ <home-manager/nixos> ];
        home-manager.users.km = { inputs, pkgs, ... }: {
	        home.packages = [ pkgs.krita ];
	        home.stateVersion = "24.05";
        };
}
