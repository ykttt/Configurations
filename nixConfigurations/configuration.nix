#
#
#	configuration.nix
#

{ inputs, config, pkgs, lib, options, ... }:
{
	imports = [
      		./hardware-configuration.nix	# Include the results of the hardware scan
      		# <home-manager/nixos>	# Use home-manager as a module
    	];

  	nix = {
		gc = {
			automatic = true;      # Farmful to SSD but nix easily get fulled with trash
			dates = "daily";
			options = "--delete-older-than 5d -d";
		};
                settings = {
                        auto-optimise-store = true;
                        builders-use-substitutes = true;        # Use binary cache
                        experimental-features = [ "nix-command" "flakes" ];
                        substituters = [
                                "https://cache.nixos.org"
                        ];
                        trusted-public-keys = [
                                "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
                        ];
                };
	};
  	console = {
                # keyMap = "jp106";             # Conflict with console.useXkbConfig
                useXkbConfig = true;            # Use xkb config in console
        };
  	time.timeZone = "Asia/Tokyo";
  	boot = {
  		plymouth.enable = true;
                tmp = {
                        cleanOnBoot = true;
                        useTmpfs = true;
                        tmpfsSize = "60%";
                };
  		loader = {
			systemd-boot.enable = true;
  			efi.canTouchEfiVariables = true;
                        timeout = 0;    # Spam space to get into boot menu
		};
	};
   	hardware = {
 		pulseaudio.enable = false;	# Enable sound with pipewire
    		openrazer.enable = true;	# For razer devices
     		graphics.enable = true;
   		nvidia = {
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
  	};
  	networking = {
		hostName = "nixRazer-15";
  		networkmanager = {
			enable = true;
			dns = "none";
			wifi.powersave = true;
		};
  		# wireless.enable = true;	# Enable wireless support by wpa_supplicant
  		# proxy.default = "http://user:password@proxy:port/";
  		# proxy.noProxy = "127.0.0.1,localhost,internal.domain";
		useDHCP = false;	# Unnecessary when managing DNS manually
		dhcpcd.enable = false;	# Unnecessary when managing DNS manually
		nameservers = [ "127.0.0.1" ];
		firewall.allowedTCPPorts = [ 443 ];
	};
	security = {
		sudo = {
			enable = true;
			wheelNeedsPassword = false;
		};
  		rtkit.enable = true;
	};
  	services = {
		chrony = {
    			enable = true;
    			enableNTS = true;	# Use NTS instead of NTP
    			servers = [ "nts.netnod.se" ];
  		};
  		displayManager.sddm = {
    			enable = true;
                        package = pkgs.kdePackages.sddm;
    			wayland.enable = true;
    			theme = "where_is_my_sddm_theme";
                        extraPackages = [ pkgs.kdePackages.qt5compat];
  		};
  		xserver = {
			#enable = true;		# False(by default) to use wayland
  			videoDrivers = ["nvidia"];	# Enable nvidia video card support BOTH for x11 and wayland
  			# videoDrivers = ["modesetting"];	# Intel version
			xkb = {
    				layout = "jp";
    				variant = "";
                                options = "ctrl:swapcaps";   # Swap control and capslock in X11 (seems not to be usable in wayland?)
  			};
		};
   		pipewire = {
    			enable = true;
    			alsa = {
				enable = true;
    				support32Bit = true;
			};
    			pulse.enable = true;		# Enable support for pulseaudio applications
    			jack.enable = true;

    			# media-session.enable = true;	# No other packages are packed yet so enabled by default

		};
		adguardhome = {
			enable = true;
			openFirewall = true;
    			settings = {
      				http = [ { address = "127.0.0.1:3000";} ];
				users = [ {
					name = "km";
					password = "$2a$10$sR0Mlbca2YQV1IZoC8XFZ.GJ9HNpBjjy4eYRzCkatABXWDZjGcZuu";      # BCrypt processed (10 times)
				} ];
      			};
		};
  		libinput.enable = true;	# Touchpad support, enabled default in most desktopManagers
  		printing.enable = true;	# Enable CUPS to print documents.
  		joycond.enable = true;
	};
  	i18n = {
		defaultLocale = "C.UTF-8";
  		extraLocaleSettings = {
    			LC_NAME = "ja_JP.UTF-8";
    			LC_TIME = "ja_JP.UTF-8";
    			LC_PAPER = "ja_JP.UTF-8";
    			LC_NUMERIC = "ja_JP.UTF-8";
    			LC_ADDRESS = "ja_JP.UTF-8";
    			LC_MONETARY = "ja_JP.UTF-8";
    			LC_TELEPHONE = "ja_JP.UTF-8";
    			LC_MEASUREMENT = "ja_JP.UTF-8";
    			LC_IDENTIFICATION = "ja_JP.UTF-8";
  		};
  		inputMethod = {
    			enable = true;
    			type = "fcitx5";
                        fcitx5 = {
                                waylandFrontend = true;
    			        addons = with pkgs; [
      				        fcitx5-gtk
      				        fcitx5-mozc
    			        ];
                        };
  		};
	};
	xdg = {
  		portal = {
    			enable = true;
    			extraPortals = with pkgs; [
      				xdg-desktop-portal-gtk
      				xdg-desktop-portal-wlr
                                xdg-desktop-portal-hyprland
    			];
  		};
	};
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
  	environment = {
		variables.EDITOR = "nvim";
		sessionVariables = {
    			QT_IM_MODULE = "fcitx";
    			# GTK_IM_MODULE = "fcitx";
    			XMODIFIERS = "@im=fcitx";
    			XDG_CACHE_HOME  = "\${HOME}/.cache";
    			XDG_CONFIG_HOME = "\${HOME}/.config";
    			XDG_BIN_HOME    = "\${HOME}/.local/bin";
    			XDG_DATA_HOME   = "\${HOME}/.local/share";
    			# XDG_DATA_DIRS   = ["/var/lib/flatpak/exports/share" "\$HOME/.local/share/flatpak/exports/share"];
    			MOZ_ENABLE_WAYLAND = "1";	# Force firefox to work in wayland

  		};
  		systemPackages = with pkgs; [
			pfetch
			pciutils
                        alsa-tools              # In order to fix audio issues on Razer Blade 15 (2023)
			pure-prompt
			zsh-vi-mode
			openrazer-daemon	# For razer devices
			where-is-my-sddm-theme
  		];
	};
	programs = {
		zsh = {
			enable = true;
			enableCompletion = true;
			autosuggestions.enable = true;
			syntaxHighlighting.enable = true;
			histSize = 10000;
			histFile = "\${HOME}/.zsh_history";
			shellAliases = {
				s = "sudo";
				q = "exit";
				rr = "ranger";
				j = "journalctl";
				srr = "sudo ranger";
				ll = "ls -l --color";
				rb = "sudo nixos-rebuild";
				gp = "git push -u origin main";
				cl = "sudo nix-collect-garbage";
				rbs = "sudo nixos-rebuild switch";
				cld = "sudo nix-collect-garbage -d";
				opm = "onedrive -s --confdir ~/.config/onedrive/main";
				opr = "onedrive -s --confdir ~/.config/onedrive/rits";
 	 		};
			interactiveShellInit = ''
				source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
			'';
			promptInit = ''
				autoload -U promptinit; promptinit
				prompt pure
				echo "\n" && pfetch
			'';
		};
		neovim = {
			enable = true;
			viAlias = true;
			vimAlias = true;
		};

                _1password = { enable = true; };
		_1password-gui = {
			enable = true;
			polkitPolicyOwners = [ "km" ];
		};
                hyprland = {
                        enable = true;
                        xwayland.enable = true;
                };
		firefox = {
			enable = true;
			preferences = {
				"widget.use-xdg-desktop-portal.file-picker" = 1;
			};
			wrapperConfig.pipewireSupport = true;	# Fix screen sharing in wayland
		};

     		steam = {
			enable = true;
			remotePlay.openFirewall = true;
			dedicatedServer.openFirewall = true;
			localNetworkGameTransfers.openFirewall = true;
		};
	};
	users = {
		defaultUserShell = pkgs.zsh;
  		users.km = {
    			isNormalUser = true;
    			description = "km";
   			extraGroups = [ "networkmanager" "wheel" "openrazer" ];
		};
	};
  	system.stateVersion = "24.05";	# Do not change/delete it for most situations
}
