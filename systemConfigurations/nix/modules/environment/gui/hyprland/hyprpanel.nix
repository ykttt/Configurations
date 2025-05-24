# hyprland/hyprpanel.nix
#
{
  inputs,
  sysinfo,
  ...
}: {
  home-manager.users.${sysinfo.target} = {
    imports = [inputs.hyprpanel.homeManagerModules.hyprpanel];
    programs.hyprpanel = {
      enable = true;
      systemd.enable = true;
      hyprland.enable = true;
      overlay.enable = true;
      # overwrite.enable = true;
      # theme = "";
      # Override the final config with an arbitrary set.
      # Useful for overriding colors in the selected theme.
      # Default: {}
      # override = {
      #   theme.bar.menus.text = "#123ABC";
      # };
      # Configure bar layouts for monitors.
      # See 'https://hyprpanel.com/configuration/panel.html'.
      # Default: null
      # layout = {
      #   "bar.layouts" = {
      #     "0" = {
      #       left = ["dashboard" "workspaces"];
      #       middle = ["media"];
      #       right = ["volume" "systray" "notifications"];
      #     };
      #   };
      # };

      # Configure and theme almost all options from the GUI.
      # Options that require '{}' or '[]' are not yet implemented,
      # except for the layout above.
      # See 'https://hyprpanel.com/configuration/settings.html'.
      # Default: <same as gui>
      # settings = {
      #   bar.launcher.autoDetectIcon = true;
      #   bar.workspaces.show_icons = true;
      #
      #   menus.clock = {
      #     time = {
      #       military = true;
      #       hideSeconds = true;
      #     };
      #     weather.unit = "metric";
      #   };
      #
      #   menus.dashboard.directories.enabled = false;
      #   menus.dashboard.stats.enable_gpu = true;
      #
      #   theme.bar.transparent = true;
      #
      #   theme.font = {
      #     name = "CaskaydiaCove NF";
      #     size = "16px";
      #   };
      # };
    };
  };
}
