#
#
#	x86Laptop/network.nix
#

{ inputs, config, pkgs, lib, options, ... }:
{
  	networking = {
  		networkmanager = {
			enable = true;
			wifi.powersave = true;
		};
  		# wireless.enable = true;	# Enable wireless support by wpa_supplicant
  		# proxy.default = "http://user:password@proxy:port/";
  		# proxy.noProxy = "127.0.0.1,localhost,internal.domain";
		useDHCP = false;	# Unnecessary when managing DNS manually
		dhcpcd.enable = false;	# Unnecessary when managing DNS manually
		firewall.allowedTCPPorts = [ 443 ];
	};
  	services.chrony = {
    		enable = true;
    		enableNTS = true;	# Use NTS instead of NTP
		servers = [ "nts.netnod.se" ];
        };
}
