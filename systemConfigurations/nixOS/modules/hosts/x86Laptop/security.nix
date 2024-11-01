#
#
#	x86Laptop/security.nix
#

{ inputs, config, pkgs, lib, options, ... }:
{
	security = {
		sudo = {
			enable = true;
			wheelNeedsPassword = false;
		};
  		rtkit.enable = true;
	};
}
