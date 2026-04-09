# niri/preferences.nix
#
_: {
  programs.niri.settings = {
    environment = {
      # CLUTTER_BACKEND = "wayland";
      # GDK_BACKEND = "wayland,x11";
      MOZ_ENABLE_WAYLAND = "1";
      NIXOS_OZONE_WL = "1";
      QT_QPA_PLATFORM = "wayland;xcb";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      SDL_VIDEODRIVER = "wayland";
      XCURSOR_SCALE = "24";
    };
    spawn-at-startup = [
      {command = ["sudo  ~/repositories/configurations/generalScripts/loginScripts/razer-sndfix/razer-sndfix.sh &"];}
      {command = ["fcitx5" "-d"];}
      {command = ["1password %U"];}
    ];
    input = {
      keyboard.xkb = {
        layout = "jp";
        options = "ctrl:swapcaps";
      };
      mod-key = "Super";
      mod-key-nested = "Alt";
      touchpad = {
        accel-profile = "adaptive";
        accel-speed = 0.3;
        click-method = "button-areas";
        dwt = true;
        dwtp = true;
        middle-emulation = true;
        natural-scroll = true;
        scroll-method = "two-finger";
        tap = true;
        tap-button-map = "left-middle-right";
      };
      mouse = {
        natural-scroll = true;
        accel-speed = 0.3;
        accel-profile = "flat";
        left-handed = false;
      };
      focus-follows-mouse = {
        enable = true;
        max-scroll-amount = "90%";
      };
      warp-mouse-to-focus.enable = true;
      workspace-auto-back-and-forth = true;
    };
    screenshot-path = "~/pictures/localFiles/screenShots/screenshot-%Y-%m-%d-%H-%M-%S.png";
    outputs = {
      "eDP-1" = {
        scale = 1.5;
        position = {
          x = 0;
          y = 0;
        };
      };
    };
    overview = {
      workspace-shadow.enable = false;
      backdrop-color = "transparent";
    };
    gestures = {hot-corners.enable = true;};
    cursor = {
      size = 20;
      # theme = "${pointer.name}";
    };
    layout = {
      focus-ring.enable = false;
      border = {
        enable = true;
        width = 2;
        # active.color = "#${base0D}";
        # inactive.color = "#${base07}";
      };
      shadow = {
        enable = false;
      };
      preset-column-widths = [
        {proportion = 0.25;}
        {proportion = 0.5;}
        {proportion = 0.75;}
        {proportion = 1.0;}
      ];
      default-column-width = {proportion = 0.5;};
      gaps = 6;
      struts = {
        left = 0;
        right = 0;
        top = 0;
        bottom = 0;
      };
      tab-indicator = {
        hide-when-single-tab = true;
        place-within-column = true;
        position = "left";
        corner-radius = 20.0;
        gap = -12.0;
        gaps-between-tabs = 10.0;
        width = 4.0;
        length.total-proportion = 0.1;
      };
    };
    animations.window-resize.custom-shader = ''
      vec4 resize_color(vec3 coords_curr_geo, vec3 size_curr_geo) {
        vec3 coords_next_geo = niri_curr_geo_to_next_geo * coords_curr_geo;

        vec3 coords_stretch = niri_geo_to_tex_next * coords_curr_geo;
        vec3 coords_crop = niri_geo_to_tex_next * coords_next_geo;

        // We can crop if the current window size is smaller than the next window
        // size. One way to tell is by comparing to 1.0 the X and Y scaling
        // coefficients in the current-to-next transformation matrix.
        bool can_crop_by_x = niri_curr_geo_to_next_geo[0][0] <= 1.0;
        bool can_crop_by_y = niri_curr_geo_to_next_geo[1][1] <= 1.0;

        vec3 coords = coords_stretch;
        if (can_crop_by_x)
            coords.x = coords_crop.x;
        if (can_crop_by_y)
            coords.y = coords_crop.y;

        vec4 color = texture2D(niri_tex_next, coords.st);

        // However, when we crop, we also want to crop out anything outside the
        // current geometry. This is because the area of the shader is unspecified
        // and usually bigger than the current geometry, so if we don't fill pixels
        // outside with transparency, the texture will leak out.
        //
        // When stretching, this is not an issue because the area outside will
        // correspond to client-side decoration shadows, which are already supposed
        // to be outside.
        if (can_crop_by_x && (coords_curr_geo.x < 0.0 || 1.0 < coords_curr_geo.x))
            color = vec4(0.0);
        if (can_crop_by_y && (coords_curr_geo.y < 0.0 || 1.0 < coords_curr_geo.y))
            color = vec4(0.0);

        return color;
      }
    '';
    prefer-no-csd = true;
    hotkey-overlay.skip-at-startup = true;
  };
}
