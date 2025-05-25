# hyprland/hyprpanel.nix
#
{
  lib,
  inputs,
  sysinfo,
  ...
}: let
  pywal = true;
in
  with lib; {
    home-manager.users.${sysinfo.target} = {
      imports = [inputs.hyprpanel.homeManagerModules.hyprpanel];
      catppuccin.kitty.enable = mkIf pywal (mkForce false);
      programs = {
        kitty.settings.include = mkIf pywal "~/.cache/wal/colors-kitty.conf";
        hyprpanel = {
          enable = true;
          hyprland.enable = true;
          overlay.enable = true;
          overwrite.enable = true;
          settings = {
            wallpaper = {
              image = "/home/km/pictures/wallpaper";
              pywal = pywal;
            };
            scalingPriority = "hyprland";
            terminal = "kitty";
            layout = {
              "bar.layouts" = {
                "*" = {
                  left = ["dashboard" "workspaces" "media" "windowtitle"];
                  middle = [];
                  right = ["clock" "systray" "network" "volume" "battery" "notifications"];
                };
              };
            };
            bar = {
              autoHide = "fullscreen";
              battery.hideLabelWhenFull = true;
              bluetooth.label = false;
              launcher.autoDetectIcon = true;
              notifications.hideCountWhenZero = true;
              scrollSpeed = 5;
              systray.ignore = ["Fcitx"];
              volume.label = false;
              windowtitle.icon = false;
              clock = {
                format = "%m/%d(%a) %H:%M:%S ";
                showIcon = false;
                showTime = true;
              };
              media = {
                format = "{artist: - }{title}";
                show_active_only = true;
                show_label = true;
                truncation = true;
                truncation_size = 30;
              };
              network = {
                label = false;
                showWifiInfo = false;
                truncation = true;
                truncation_size = 7;
              };
              workspaces = {
                applicationIconOncePerWorkspace = true;
                monitorSpecific = true;
                numbered_active_indicator = "underline";
                reverse_scroll = false;
                showAllActive = true;
                showApplicationIcons = true;
                show_icons = true;
                show_numbered = false;
                workspaces = 10;
              };
            };
            menus = {
              clock = {
                time = {
                  military = true;
                  hideSeconds = true;
                };
                weather = {
                  unit = "metric";
                  enabled = true;
                  interval = 60000;
                  key = "";
                  location = "Los Angeles";
                };
              };
              dashboard = {
                controls.enabled = true;
                directories.enabled = false;
                powermenu = {
                  confirmation = true;
                  avatar.image = "/home/km/pictures/mainOneDrivePictureSync/iPhone13Mini/2-IMG_0089.png";
                };
                recording.path = "$HOME/videos/screenCasts";
                shortcuts.enabled = true;
              };
            };
            notifications = {
              position = "bottom right";
              ignore = [];
              timeout = 7000;
            };
            theme = {
              bar = {
                buttons = {
                  spacing = "0.4em";
                  monochrome = false;
                  enableBorders = true;
                };
                dropdownGap = "2.9em";
                enableShadow = false;
                floating = true;
                layer = "bottom";
                location = "top";
                transparent = true;
              };
              font = {
                name = "Sarasa Term J";
                size = "1.2rem";
                weight = 600;
              };
              matugen = true;
              matugen_settings = {
                contrast = 0;
                mode = "dark";
                scheme_type = "neutral";
                variation = "vivid_1";
              };
            };
          };
        };
      };
    };
  }
