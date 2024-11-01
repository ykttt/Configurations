#
#
#	nixRazer-15/modules.nix
#

{ inputs, config, pkgs, lib, options, ... }:
{
	imports = [
                "../../modules/hosts/x86Laptop"

                "../../modules/drivers/razer"
                "../../modules/drivers/nvidia"

                "../../modules/gui/general"
                "../../modules/gui/hyprland"

                "../../modules/applications/basic"
                "../../modules/applications/development/git"
                "../../modules/applications/security/adGuardHome"
                "../../modules/applications/security/1Password"
                "../../modules/applications/edit/nvim"
                "../../modules/applications/edit/tex"
                "../../modules/applications/edit/onlyOffice"
                "../../modules/applications/network/zen"
                "../../modules/applications/network/zoom"
                "../../modules/applications/creativity/krita"
                "../../modules/applications/game/steam"
    	];
  	networking.hostName = "nixRazer-15";
	users = {
  		users.km = {
                        isNormalUser = true;
                        description = "km";
                        extraGroups = [
                                "networkmanager"                        
                                "wheel"
                                "openrazer"
                        ];
		};
	};
  	system.stateVersion = "24.05";	# Don't change/delete it for most situations
}
