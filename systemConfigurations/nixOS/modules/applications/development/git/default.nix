#
#
#	git/default.nix
#

{ inputs, config, pkgs, lib, options, ... }:
{
        home-manager.users.km = { inputs, pkgs, ... }: {
                home.packages = [ pkgs.gh ];
		programs.ssh.matchBlocks.km = {
			port = 443;
			host = "ssh.github.com";
			identityFile = [ "/home/km/.ssh/id_ed25519" ];
		};
	        programs.git = {
		        enable = true;
		        lfs.enable = true;
			userName = "J. Peng";
			userEmail = "ykttt@tuta.io";
			aliases = {
				a = "add";
				p = "push";
                                r = "reset";
				s = "status";
				c = "commit";
				aa = "add *";
				cl = "clone";
                                cf = "config";
				co = "checkout";
			};
                        extraConfig = {
			        init.defaultBranch = "main";
			        url = {
                                        "https://github.com/".insteadOf = ["gh:" "github:"];
			                "https://gitlab.com/".insteadOf = ["gl:" "gitlab:"];
                                };
                        };
	        };
	        home.stateVersion = "24.05";
        };
}
