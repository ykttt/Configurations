#
#
#	hyprland/default.nix
#

{ inputs, config, pkgs, lib, options, ... }:
{
	imports = [
                ./ags.nix
                ./anyrun.nix
                ./hyprland.nix
                ./kitty.nix
                ./nm-applet.nix
        ];
}
