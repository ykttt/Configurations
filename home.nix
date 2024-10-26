#
#
#	home.nix
#

{ inputs, pkgs, ... }:
{
        imports = with inputs; [
                ags.homeManagerModules.default 
                anyrun.homeManagerModules.default
        ];
                home = {
                username = "km";
                homeDirectory = "/home/km";
        };
        nix.settings = {
                builders-use-substitutes = true;
                extra-substituters = [
                        "https://anyrun.cachix.org"
                ];
                extra-trusted-public-keys = [
                        "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
                ];
        };
        nixpkgs.config.allowUnfree = true;
	home.packages = with pkgs; [
		gh
		gcc
                w3m
                nil
		mpv
                wofi    # TODO: To be replaced
		krita
		mupdf
                swaybg
		ranger
                texlab
                ltex-ls
		neovide
		gnumake
		zoom-us
                pyright
		zathura
		discord
                latexrun
                onedrive
                wlsunset
                playerctl
                clang-tools
                tree-sitter
		thunderbird
		texliveFull
                adwsteamgtk
                wl-clipboard
                brightnessctl
		polychromatic
                lua-language-server
		onlyoffice-desktopeditors
	];
	programs = {
		ssh.matchBlocks.km = {
			port = 443;
			host = "ssh.github.com";
			identityFile = [
				"/home/km/.ssh/id_ed25519"
			];
		};
                kitty = {
                        enable = true;
                        themeFile = "Nord";
                        keybindings = {
                                "alt+t" = "new_tab";
                                "alt+tab" = "next_tab";
                                "alt+shift+tab" = "previous_tab";
                                "alt+i" = "launch --location=hsplit";
                                "alt+o" = "launch --location=vsplit";
                                "alt+h" = "neighboring_window left";
                                "alt+j" = "neighboring_window down";
                                "alt+k" = "neighboring_window up";
                                "alt+l" = "neighboring_window right";
                                "ctrl+alt+h" = "move_window left";
                                "ctrl+alt+j" = "move_window down";
                                "ctrl+alt+k" = "move_window up";
                                "ctrl+alt+l" = "move_window right";
                        };
                        settings = {
                                font_family = "Sarasa Term J";
                                font_size = "13.0";
                                scrollback_lines = 10000;
                                paste_actions = "quote-urls-at-prompt";
                                strip_trailing_spaces = "never";
                                remote_kitty = "if-needed";
                                select_by_word_characters = "@-./_~?&=%+#";
                                show_hyperlink_targets = true;
                                remember_window_size  = false;
                                initial_window_width = 1000;
                                initial_window_height = 618;
                                tab_bar_style = "powerline";
                                tab_powerline_style = "round";
                                enabled_layouts = "splits";
                                tab_bar_align = "left";
                                tab_bar_edge = "bottom";
                                background_opacity = "0.8";
                                background_blur = 1;
                        };
                };
                neovim = {
                        enable = true;
                        withPython3 = true;
                        withNodeJs = true;
                };
	        git = {
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
                ags = {
                        enable = true;
                        configDir = ./externalPackageSettings/ags;
                        extraPackages = with pkgs; [
                                webkitgtk
                                gtksourceview
                                accountsservice
                        ];
                };
                anyrun = {
                        enable = true;
                        config = {
                                x = { fraction = 0.5; };
                                y = { fraction = 0.3; };
                                width = { fraction = 0.3; };
                                hideIcons = false;
                                ignoreExclusiveZones = false;
                                layer = "overlay";
                                hidePluginInfo = false;
                                closeOnClick = false;
                                showResultsImmediately = false;
                                maxEntries = null;
                                plugins = [
                                        inputs.anyrun.packages.${pkgs.system}.applications
                                        inputs.anyrun.packages.${pkgs.system}.shell
                                        inputs.anyrun.packages.${pkgs.system}.kidex
                                ];
                        };
                };
                ranger = {
                        enable = true;
                        settings = { preview_images_method = "kitty"; };
                };
	};
        services.dunst = {
                enable = true;
                settings.global = {
                        origin = "top-left";
                        offset = "60x12";
                        separator_height = 2;
                        padding = 12;
                        horizontal_padding = 12;
                        text_icon_padding = 12;
                        frame_width = 4;
                        separator_color = "frame";
                        idle_threshold = 120;
                        font = "Sarasa Term J 12";
                        line_height = 0;
                        format = "<b>%s</b>\n%b";
                        alignment = "center";
                        icon_position = "off";
                        startup_notification = "false";
                        corner_radius = 12;
                        frame_color = "#44465c";
                        background = "#303241";
                        foreground = "#d9e0ee";
                        timeout = 2;
                };
        };
	home.stateVersion = "24.05";	# The same
}
