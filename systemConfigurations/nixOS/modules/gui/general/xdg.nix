#
#
#	general/xdg.nix
#

{ inputs, config, pkgs, lib, options, ... }:
{
	xdg.portal = {
    		enable = true;
    		extraPortals = with pkgs; [
			xdg-desktop-portal-gtk
                        xdg-desktop-portal-wlr
    		];
  	};
  	environment.sessionVariables = {
    		XDG_CACHE_HOME  = "\${HOME}/.cache";
    		XDG_CONFIG_HOME = "\${HOME}/.config";
		XDG_BIN_HOME    = "\${HOME}/.local/bin";
    		XDG_DATA_HOME   = "\${HOME}/.local/share";
    		# XDG_DATA_DIRS   = ["/var/lib/flatpak/exports/share" "\$HOME/.local/share/flatpak/exports/share"];
  	};
}
