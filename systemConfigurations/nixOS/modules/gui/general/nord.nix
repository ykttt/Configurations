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
                                package = "pkgs.papirus-nord";
                        };
                        cursorTheme = {
                                name = "nordzyCursor";
                                package = "pkgs.nordzy-cursor-theme";
                        };
                };
	        programs.kitty.themeFile = "Nordfox";
	        home.stateVersion = "24.05";
        };
}
