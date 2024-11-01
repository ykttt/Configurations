#
#
#	steam/default.nix
#

{ inputs, config, pkgs, lib, options, ... }:
{
     	programs.steam = {
		enable = true;
		remotePlay.openFirewall = true;
		dedicatedServer.openFirewall = true;
		localNetworkGameTransfers.openFirewall = true;
	};
        home-manager.users.km = { inputs, pkgs, ... }: {
	        home.packages = [ pkgs.adwsteamgtk ];
	        home.stateVersion = "24.05";
        };
}
