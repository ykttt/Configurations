#
#
#	nvidia/default.nix
#

{ inputs, config, pkgs, lib, options, ... }:
{
        services.xserver.videoDrivers = ["nvidia"];
    	hardware.nvidia = {
    		open = false;	# Disable open-source drivers
    		modesetting.enable = true;
		package = config.boot.kernelPackages.nvidiaPackages.stable;
    		nvidiaSettings = true;
    		powerManagement = {
			enable = false;		# Experimental, may cause problems
    			finegrained = false;
		};
    		prime = {
			intelBusId = "PCI:0:2:0";
			nvidiaBusId = "PCI:1:0:0";
        		# amdgpuBusId = "PCI:5:0:0";
        		# sync.enable = true;	# Conflict with offload
			offload = {
	  			enable = true;
				enableOffloadCmd = true;
			};
    		};
  	};
}
