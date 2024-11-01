#
#
#	general/externalThemes.nix
#

{ inputs, config, pkgs, lib, options, ... }:
{
        home-manager.users.km = { inputs, pkgs, ... }: {
                home.packages = [ pkgs.nwg-look ];
	        # programs.kitty.themeFile = "Nord";
	        home.stateVersion = "24.05";
        };
}
