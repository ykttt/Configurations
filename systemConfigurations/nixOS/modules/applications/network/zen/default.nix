#
#
#	zen/default.nix
#

{ inputs, config, pkgs, lib, options, ... }:
{
	imports = [ <home-manager/nixos> ];
        home-manager.users.km = { inputs, pkgs, ... }: {
	        home.packages = with inputs; [
                        zen-browser.packages."${pkgs.system}".specific
	        ];
	        home.stateVersion = "24.05";
        };
}
