#
#
#	onlyOffice/default.nix
#

{ inputs, config, pkgs, lib, options, ... }:
{
	imports = [ <home-manager/nixos> ];
        home-manager.users.km = { inputs, pkgs, ... }: {
	        home.packages = with pkgs; [
		        onlyoffice-desktopeditors
	        ];
	        home.stateVersion = "24.05";
        };
}
