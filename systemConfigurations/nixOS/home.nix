#
#
#	home.nix
#

{ inputs, pkgs, ... }:
{
        imports = with inputs; [
                ags.homeManagerModules.default 
                anyrun.homeManagerModules.default
                catppuccin.homeManagerModules.catppuccin
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
		krita
		mupdf
                texlab
                ltex-ls
		neovide
		gnumake
		zoom-us
                pyright
		zathura
		discord
                nautilus
                latexrun
                onedrive
                wlsunset
                hyprpaper
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
	] ++ ( with inputs; [
                zen-browser.packages."${pkgs.system}".specific
        ]);
        catppuccin = {
                flavor = "mocha";
                # enable = true;
                pointerCursor.enable = true;
        };
        gtk = {
                enable = true;
                catppuccin = {
                        enable = true;
                        icon.enable = true;
                        gnomeShellTheme = true;
                        size = "compact";
                };
        };
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
                        catppuccin.enable = true;
                        # themeFile = "Nord";
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
                yazi = {
                        enable = true;
                        catppuccin.enable = true;
                        enableZshIntegration = true;
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
                        # configDir = ../../externalPackageSettings/ags;
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
                                plugins = with inputs.anyrun.packages.${pkgs.system}; [
                                        applications
                                        dictionary
                                        websearch
                                        rink
                                        shell
                                        kidex
                                ];
                        };
                        extraCss = ''
                                * {
                                        all: unset;
                                        font-size: 1.3rem;
                                } #window, #match, #entry, #plugin, #main {
                                        background: transparent;
                                } #match.activatable {
                                        border-radius: 16px;
                                        padding: 0.3rem 0.9rem;
                                        margin-top: 0.01rem;
                                } #match.activatable:first-child {
                                        margin-top: 0.7rem;
                                } #match.activatable:last-child {
                                        margin-bottom: 0.6rem;
                                } #plugin:hover #match.activatable {
                                        border-radius: 10px;
                                        padding: 0.3rem;
                                        margin-top: 0.01rem;
                                        margin-bottom: 0;
                                } #match:selected, #match:hover, #plugin:hover {
                                        background: #2e3131;
                                } #entry {
                                        background: #0b0f10;
                                        border: 1px solid #0b0f10;
                                        border-radius: 16px;
                                        margin: 0.5rem;
                                        padding: 0.3rem 1rem;
                                } list > #plugin {
                                        border-radius: 16px;
                                        margin: 0 0.3rem;
                                } list > #plugin:first-child {
                                        margin-top: 0.3rem;
                                } list > #plugin:last-child {
                                        margin-bottom: 0.3rem;
                                } list > #plugin:hover {
                                        padding: 0.6rem;
                                } box#main {
                                        background: #0b0f10;
                                        box-shadow: inset 0 0 0 1px #0b0f10, 0 0 0 1px #0b0f10;
                                        border-radius: 24px;
                                        padding: 0.3rem;
                                }
                        '';
                        extraConfigFiles = {
                                "applications.ron".text = ''
                                        Config(
                                                desktop_actions: false,
                                                max_entries: 5, 
                                                terminal: Some("kitty"),
                                        ) '';
                                "shell.ron".text = ''
                                        Config(
                                                prefix: ";",
                                                shell: None,
                                        )
                                '';
                                "kidex.ron".text = ''
                                        Config(
                                                max_entries: 3,
                                        )
                                '';
                                "dictionary.ron".text = ''
                                        Config(
                                                prefix: ":",
                                                max_entries: 5,
                                        )
                                '';
                                "websearch.ron".text = ''
                                        Config(
                                                prefix: "/",
                                                        // Custom(
                                                        //   name: "Searx",
                                                        //   url: "searx.be/?q={}",
                                                        // )
                                                engines: [DuckDuckGo]
                                        )
                                '';
                        };
                };
	};
	home.stateVersion = "24.05";	# The same
}
