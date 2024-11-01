#
#
#	general/nord.nix
#

{ inputs, config, pkgs, lib, options, ... }:
{
        home-manager.users.km = { inputs, pkgs, ... }: {
                gtk = {
                        iconTheme = {
                                name = "papirusNord";
                                package = pkgs.papirus-icon-theme;
                        };
                        cursorTheme = {
                                name = "nordzyCursor";
                                package = pkgs.nordzy-cursor-theme;
                        };
                };
	        programs.kitty.themeFile = "Nord";
	        home.stateVersion = "24.05";
        };
}
