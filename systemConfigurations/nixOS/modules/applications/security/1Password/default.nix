#
#
#	1Password/default.nix
#

{ inputs, config, pkgs, lib, options, ... }:
{
	programs = {
                _1password = { enable = true; };
		_1password-gui = {
			enable = true;
			polkitPolicyOwners = [ "km" ];
		};
        };
}
