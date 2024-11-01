#
#
#	hyprland/ags.nix
#

{ inputs, config, pkgs, lib, options, ... }:
{
	imports = [ <home-manager/nixos> ];
        home-manager.users.km = { inputs, pkgs, ... }: {
                imports = [ inputs.ags.homeManagerModules.default ];
	        home.packages = with pkgs; [
                        playerctl
                        dart-sass
                        pwvucontrol
                        wl-clipboard
                        brightnessctl
	        ];
	        programs.ags = {
                        enable = true;
                        # configDir = ../../externalPackageSettings/ags;
                        extraPackages = with pkgs; [
                                webkitgtk
                                gtksourceview
                                accountsservice
                        ];
                };
	        home.stateVersion = "24.05";
        };
}
