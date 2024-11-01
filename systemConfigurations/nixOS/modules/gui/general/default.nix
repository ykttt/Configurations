#
#
#	general/default.nix
#

{ inputs, config, pkgs, lib, options, ... }:
{
	imports = [
                ./catppuccin.nix
                ./nord.nix
                ./fcitx.nix
                ./fonts.nix
                ./sddm.nix
                ./xdg.nix
        ];
}
