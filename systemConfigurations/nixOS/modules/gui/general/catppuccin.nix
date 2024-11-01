#
#
#	general/catppuccin.nix
#

{ inputs, config, pkgs, lib, options, ... }:
{
	imports = [ <home-manager/nixos> ];
        home-manager.users.km = { inputs, pkgs, ... }: {
                imports = [ inputs.catppuccin.homeManagerModules.catppuccin ];
                catppuccin = {
                        flavor = "mocha";
                        # enable = true;
                        pointerCursor.enable = true;
                };
                gtk.catppuccin = {
                        enable = true;
                        icon.enable = true;
                        gnomeShellTheme = true;
                        size = "compact";
                };
	        programs.kitty.catppuccin.enable = true;
	        home.stateVersion = "24.05";
        };
}
