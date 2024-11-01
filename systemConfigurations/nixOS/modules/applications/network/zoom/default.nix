#
#
#	zen/default.nix
#

{ inputs, config, pkgs, lib, options, ... }:
{
	imports = [ <home-manager/nixos> ];
        home-manager.users.km = { inputs, pkgs, ... }: {
                nixpkgs.config.allowUnfree = true;
	        home.packages = [ pkgs.zoom-us ];
	        home.stateVersion = "24.05";
        };
}
