# hyprland/preferences.nix
#
{sysinfo, ...}: {
  home-manager.users.${sysinfo.target}.wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";
    "$terminal" = "kitty";
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
      layout = "master";
    };
    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };
    master = {
      mfact = "0.618";
      new_status = "master";
      orientation = "right";
      inherit_fullscreen = true;
    };
    misc = {
      force_default_wallpaper = -1;
      disable_hyprland_logo = true;
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
