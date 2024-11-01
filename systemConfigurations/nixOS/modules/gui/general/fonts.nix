#
#
#	general/default.nix
#

{ inputs, config, pkgs, lib, options, ... }:
{
  	fonts = {
		packages = with pkgs; [
     			nerdfonts
     			wqy_zenhei		# Required by pkgs.steam to display CJK characters
     			noto-fonts
     			sarasa-gothic
     			noto-fonts-emoji
     			noto-fonts-extra
     			noto-fonts-cjk-sans
  		];
  		fontDir.enable = true;
  		fontconfig.enable = true;
	};
}
