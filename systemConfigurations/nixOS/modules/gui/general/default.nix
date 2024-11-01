#
#
#	general/default.nix
#

{ inputs, config, pkgs, lib, options, ... }:
{
	imports = [
                # ./externalThemes.nix
                ./catppuccin.nix
                ./fcitx.nix
                ./fonts.nix
                ./sddm.nix
                ./xdg.nix
        ];
}
