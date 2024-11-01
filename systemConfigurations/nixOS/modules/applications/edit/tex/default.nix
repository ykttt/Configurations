#
#
#	tex/default.nix
#

{ inputs, config, pkgs, lib, options, ... }:
{
	imports = [ <home-manager/nixos> ];
        home-manager.users.km = { inputs, pkgs, ... }: {
	        home.packages = with pkgs; [
		        mupdf
                        texlab
		        zathura
                        latexrun
		        texliveFull
	        ];
	        home.stateVersion = "24.05";
        };
}
