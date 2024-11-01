#
#
#	zen/default.nix
#

{ inputs, config, pkgs, lib, options, ... }:
{
        home-manager.users.km = { inputs, pkgs, ... }: {
	        home.packages = with inputs; [
                        zen-browser.packages."${pkgs.system}".specific
	        ];
	        home.stateVersion = "24.05";
        };
}
