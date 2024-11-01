#
#
#	zen/default.nix
#

{ inputs, config, pkgs, lib, options, ... }:
{
        home-manager.users.km = { inputs, pkgs, ... }: {
                nixpkgs.config.allowUnfree = true;
	        home.packages = [ pkgs.zoom-us ];
	        home.stateVersion = "24.05";
        };
}
