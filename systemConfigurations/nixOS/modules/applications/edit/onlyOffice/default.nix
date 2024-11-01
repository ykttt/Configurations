#
#
#	onlyOffice/default.nix
#

{ inputs, config, pkgs, lib, options, ... }:
{
        home-manager.users.km = { inputs, pkgs, ... }: {
	        home.packages = with pkgs; [
		        onlyoffice-desktopeditors
	        ];
	        home.stateVersion = "24.05";
        };
}
