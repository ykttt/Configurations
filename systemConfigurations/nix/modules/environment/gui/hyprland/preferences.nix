# hyprland/preferences.nix
#
{sysinfo, ...}: {
  home-manager.users.${sysinfo.target}.wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";
    "$terminal" = "kitty";
    "$fileManager" = "ranger";
    "$runmenu" = "ags -t launcher";
    xwayland.force_zero_scaling = true;
    general = {
      gaps_in = 5;
      gaps_out = 20;
      border_size = 2;
      # "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
      # "col.inactive_border" = "rgba(595959aa)";
      resize_on_border = false;
      allow_tearing = false;
      layout = "dwindle";
    };
    dwindle = {
      pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
      preserve_split = true; # You probably want this
    };
    master = {
      new_status = "master";
    };
    misc = {
      force_default_wallpaper = -1; # Set to 0 or 1 to disable the anime mascot wallpapers
      disable_hyprland_logo = true; # If true disables the random hyprland logo background. :(
    };
    input = {
      kb_layout = "jp";
      kb_options = "ctrl:swapcaps";
      follow_mouse = 1;
      sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
      touchpad = {
        natural_scroll = true;
      };
    };
    gestures = {
      workspace_swipe = true;
    };
    device = {
      name = "epic-mouse-v1";
      sensitivity = -0.5;
    };
  };
}
