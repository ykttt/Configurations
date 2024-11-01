#
#
#	hyprland/hyprland.nix
#

{ inputs, config, pkgs, lib, options, ... }:
{
	imports = [ <home-manager/nixos> ];
	programs.hyprland = {
                enable = true;
                xwayland.enable = true;
        };
	xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
        home-manager.users.km = { pkgs, ... }: {
	        home.packages = with pkgs; [
                        wlsunset
                        hyprpaper
                        hyprlock
	        ];
                gtk.enable = true;
	        home.stateVersion = "24.05";
        };
 
}
